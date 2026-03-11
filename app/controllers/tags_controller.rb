class TagsController < ApplicationController
  # POST /tags/consolidate.json
  # Uses the wizard to find conceptually similar tags, then merges their item_tags into one tag per group.
  def consolidate
    tag_names = Tag.joins(:item_tags).distinct.pluck(:name)
    if tag_names.empty?
      render json: { merged_groups: [], message: "No tags to consolidate." }
      return
    end

    prompt = consolidation_prompt(tag_names)
    response_format = "json_object"

    begin
      result = WizardService.ask(prompt, response_format)
      groups = result["groups"] || result[:groups] || []
      merged = perform_consolidation(groups)
      render json: { merged_groups: merged, message: "Consolidation complete." }
    rescue => e
      Rails.logger.error "Tags consolidate failed: #{e.message}\n#{e.backtrace.first(5).join("\n")}"
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  # GET /tags.json
  # Returns all tags that are actually used (have at least one item_tag)
  def index
    @tags = Tag.joins(:item_tags).distinct

    respond_to do |format|
      format.json { render json: @tags, each_serializer: TagSerializer }
    end
  end

  # GET /tags/:id.json
  # Returns a tag with its tagged items grouped by model
  #
  # Response shape:
  # {
  #   id: 1,
  #   name: "prophethood",
  #   items: {
  #     "Conclusion": [ { ...serialized conclusion... }, ... ],
  #     "OtherModel": [ ... ]
  #   }
  # }
  def show
    @tag = Tag.find(params[:id])

    grouped = {}

    @tag.item_tags.includes(taggable: { narration: { hadith_book: :hadith_collection } }).each do |item_tag|
      next if item_tag.taggable.nil?

      type = item_tag.taggable_type
      grouped[type] ||= []
      grouped[type] << item_tag.taggable
    end

    rendered_items = {}

    grouped.each do |type, records|
      serializer_class = serializer_for_type(type)

      rendered_items[type] =
        if serializer_class
          ActiveModel::Serializer::CollectionSerializer.new(records, serializer: serializer_class)
        else
          records.as_json
        end
    end

    render json: {
      id: @tag.id,
      name: @tag.name,
      items: rendered_items
    }
  end

  private

  def consolidation_prompt(tag_names)
    list = tag_names.sort.uniq.join(", ")
    <<~PROMPT.strip
      You are given a list of tags from a knowledge base: #{list}

      Find groups of tags that refer to the same or very close concept (e.g. "prophethood", "prophetic", "prophet" might be one group).
      For each group, choose one canonical tag name (the best single word or short phrase to keep) and list all tag names that should be merged into it.

      Respond with a single JSON object with key "groups". Each element of "groups" must be an object with:
      - "canonical_name": the tag name to keep (string)
      - "merge_tag_names": array of all tag names in this group (including the canonical one), e.g. ["prophethood", "prophetic", "prophet"]

      Only suggest groups where there are at least 2 tags that are conceptually the same or very close. Do not invent tag names; only use names from the list above.
      If no tags are similar, return {"groups": []}.
    PROMPT
  end

  def perform_consolidation(groups)
    return [] unless groups.is_a?(Array)

    merged = []
    groups.each do |g|
      canonical_name = (g["canonical_name"] || g[:canonical_name]).to_s.strip
      names = Array(g["merge_tag_names"] || g[:merge_tag_names]).map { |n| n.to_s.strip }.reject(&:blank?)
      next if canonical_name.blank? || names.size < 2

      canonical = Tag.find_by(name: canonical_name)
      canonical ||= Tag.create!(name: canonical_name)

      tags_to_merge = names.map { |n| Tag.find_by(name: n) }.compact.uniq
      tags_to_merge -= [canonical]

      tags_to_merge.each do |tag|
        tag.item_tags.each do |it|
          existing = ItemTag.find_by(tag: canonical, taggable_type: it.taggable_type, taggable_id: it.taggable_id)
          if existing
            it.destroy
          else
            it.update!(tag: canonical)
          end
        end
        tag.reload
        tag.destroy if tag.item_tags.empty?
        merged << { canonical: canonical_name, merged: tag.name }
      end
    end
    merged
  end

  def serializer_for_type(type)
    case type
    when 'Conclusion'
      ConclusionSerializer
    else
      nil
    end
  end
end

