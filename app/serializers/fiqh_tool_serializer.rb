class FiqhToolSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :position, :fiqh_tool_id, :created_at, :updated_at
  
  has_many :children, serializer: FiqhToolSerializer
end

