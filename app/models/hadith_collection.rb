class HadithCollection < ActiveRecord::Base
	has_many :hadith_books, dependent: :destroy
	has_many :hadith_chapters, :through => :hadith_books, dependent: :destroy
	has_many :narrations, :through => :hadith_chapters, dependent: :destroy
	has_many :narrations, :through => :hadith_books, dependent: :destroy
end
