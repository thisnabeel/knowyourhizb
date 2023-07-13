# http://www.natadarrab.com/verbs/1230.json

desc "Fetch From Arbaeen"
task :fetch_arbaeen => :environment do
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

	url = "https://sunnah.com/nawawi40"

	if HadithCollection.find_by_title("الأربعون النووية").present?
		@collection = HadithCollection.find_by_title("الأربعون النووية")
		@collection.hadith_books.all.destroy_all
		@collection.narrations.all.destroy_all
	else
		@collection = HadithCollection.create(title: "الأربعون النووية") 
	end

	hb = HadithBook.create(title: "Full Book", position: 1, hadith_collection_id: @collection.id)

	i = 0

	doc = Nokogiri::HTML(open(url))
	puts doc
	hc = HadithChapter.create(hadith_book_id: hb.id, title: "Default")
	doc.css(".hadithTextContainers").each_with_index do |box, index|
		hadith = doc.css(".arabic_hadith_full").text
		english = doc.css(".englishcontainer").text
		Narration.create(english: english, arabic: hadith, hadith_chapter_id: hc.id, hadith_book_id: hb.id, position: index + 1)
		
		i = i + 1
	end


	puts "Done! Total Narrations: #{i}" 
	

end