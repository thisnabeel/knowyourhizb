class Chapter < ActiveRecord::Base
  belongs_to :chapter

  has_many :chapters, dependent: :destroy
  has_many :pieces, dependent: :destroy
  has_many :lines,  dependent: :destroy

  # after_create :init_position
  after_create :make_slug

  def extract_words
	Arabic.words(self.body)
  end
  
	# Find all chapters and check if they have slug
	def self.make_slugs
		Chapter.where(slug: nil).each do |s|
			s.make_slug
		end
	end

	def make_slug
		title = self.title.parameterize
		while !self.update(slug: title)
			title = "#{self.title.parameterize}-#{self.id}"
		end
  end
end
