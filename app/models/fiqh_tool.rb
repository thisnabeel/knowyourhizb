class FiqhTool < ActiveRecord::Base
  belongs_to :parent, class_name: "FiqhTool", foreign_key: "fiqh_tool_id", optional: true
  has_many :children, -> { order(:position, :id) }, class_name: "FiqhTool", foreign_key: "fiqh_tool_id", dependent: :destroy

  scope :roots, -> { where(fiqh_tool_id: nil) }
  scope :ordered, -> { order(:position, :id) }
end

