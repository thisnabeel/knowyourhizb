class ConclusionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :position, :signal

  has_one :narration
  has_many :tags
end
