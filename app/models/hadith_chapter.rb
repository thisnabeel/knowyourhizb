class HadithChapter < ActiveRecord::Base

	belongs_to :hadith_book
	has_many :narrations, dependent: :destroy

	# after_create :set_position

	accepts_nested_attributes_for :narrations,
    allow_destroy: true

    # scope :ordered_nesties, order("position DESC")

	# def set_position
	# 	chapters_list = self.hadith_book.hadith_chapters
	# 	if chapters_list.count > 1
	# 		self.update_attributes(position: chapters_list.count)
	# 	else
	# 		self.update_attributes(position: 1)
	# 	end
	# end

end
