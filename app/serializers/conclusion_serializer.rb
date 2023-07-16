class ConclusionSerializer < ActiveModel::Serializer
  attributes :id, :body, :position, :signal
  has_one :narration
end
