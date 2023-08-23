class PieceSerializer < ActiveModel::Serializer
  attributes :id, :recording_url, :video_url, :translation, :chapter, :uuid, :position
end
