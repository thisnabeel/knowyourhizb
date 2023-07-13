class HadithBook < ActiveRecord::Base
	
	belongs_to :hadith_collection
	has_many :hadith_chapters, dependent: :destroy
	has_many :narrations

	accepts_nested_attributes_for :hadith_chapters,
    allow_destroy: true

    after_create :set_position

	def set_position
		chapters_list = self.hadith_collection.hadith_books
		if chapters_list.count > 1
			self.update_attributes(position: chapters_list.count)
		else
			self.update_attributes(position: 1)
		end
	end

	def stage_1_progress

		number = self.narrations.where.not(annotated_arabic: nil).count
		
		total = self.narrations.count
		
		final = number.to_f / total.to_f * 100.0
		return final.to_i

	end
end
