# http://www.natadarrab.com/verbs/1230.json

desc "Fetch From Bukhari"
task :fetch_bukhari_books => :environment do
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

	url = "https://sunnah.com/bukhari"
	@collection = HadithCollection.find_or_create_by(title: "Sahih Bukhari")

		@collection.hadith_books.destroy_all
	
		doc = Nokogiri::HTML(open(url))
		doc.css(".arabic_book_name").each_with_index do |book, index|
			HadithBook.create(hadith_collection_id: @collection.id, title: book.text, position: index + 1)
			puts book.text
		end


	puts "Done! Total Books: " + $total.to_s
	

end