class Tag < ActiveRecord::Base
  has_many :item_tags, dependent: :destroy
  has_many :conclusions, through: :item_tags, source: :taggable, source_type: 'Conclusion'

  validates :name, presence: true, uniqueness: true
end

