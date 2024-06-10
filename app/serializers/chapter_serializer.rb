class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :lines, :chapter_id


  def options
    instance_options[:serializer_options]
  end

  def lines
    if options && options[:lines]
      object.lines.order('position ASC')
    else
      return []
    end
  end
end
