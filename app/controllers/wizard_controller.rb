class WizardController < ApplicationController
  def ask
    prompt = params[:prompt]
    response_format = params[:response_format] || "json_object"
    narration_id = params[:narration_id]

    if prompt.blank?
      render json: { error: "Prompt is required" }, status: :unprocessable_entity
      return
    end

    begin
      result = WizardService.ask(prompt, response_format)

      if narration_id.present?
        narration = Narration.find(narration_id)
        items = result.is_a?(Array) ? result : Array(result["conclusions"] || result[:conclusions])

        created = []
        if items.any?
          base_position = (narration.conclusions.maximum(:position) || 0).to_i
          items.each_with_index do |item, index|
            conclusion = narration.conclusions.create!(
              title: item["title"],
              body: item["description"],
              position: base_position + index + 1
            )

            Array(item["potential_tags"] || item[:potential_tags]).each do |tag_name|
              next if tag_name.blank?
              tag = Tag.find_or_create_by!(name: tag_name.to_s.strip)
              ItemTag.find_or_create_by!(tag: tag, taggable: conclusion)
            end

            created << conclusion
          end
        end

        render json: created, each_serializer: ConclusionSerializer
      else
        render json: result
      end
    rescue => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end
end
