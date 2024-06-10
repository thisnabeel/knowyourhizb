class LineSerializer < ActiveModel::Serializer
  attributes :id, :font_style, :content, :direction, :position, :recording_url
  has_one :chapter
end
