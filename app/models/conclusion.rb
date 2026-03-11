class Conclusion < ActiveRecord::Base
  belongs_to :narration

  has_many :item_tags, as: :taggable, dependent: :destroy
  has_many :tags, through: :item_tags
end
