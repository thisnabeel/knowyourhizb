# http://www.natadarrab.com/verbs/1230.json

desc "Fetch From Bukhari"
task :fetch_musnad => :environment do
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
	
	HadithCollection.find_by_title("مسند أحمد بن حنبل").destroy
	collection = HadithCollection.create(title:"مسند أحمد بن حنبل")

	list = ["https://ar.wikisource.org/wiki/%D9%85%D8%B3%D9%86%D8%AF_%D8%A3%D8%AD%D9%85%D8%AF_%D8%A8%D9%86_%D8%AD%D9%86%D8%A8%D9%84/%D8%A7%D9%84%D9%85%D8%AC%D9%84%D8%AF_%D8%A7%D9%84%D8%A3%D9%88%D9%84/%D9%85%D8%B3%D9%86%D8%AF_%D8%A3%D8%A8%D9%88_%D8%A8%D9%83%D8%B1_%D8%A7%D9%84%D8%B5%D8%AF%D9%8A%D9%82_(1)", 
		"https://ar.wikisource.org/wiki/%D9%85%D8%B3%D9%86%D8%AF_%D8%A3%D8%AD%D9%85%D8%AF_%D8%A8%D9%86_%D8%AD%D9%86%D8%A8%D9%84/%D9%85%D8%B3%D9%86%D8%AF_%D8%B9%D8%A8%D8%AF_%D8%A7%D9%84%D9%84%D9%87_%D8%A8%D9%86_%D8%B9%D9%85%D8%B1_%D8%A8%D9%86_%D8%A7%D9%84%D8%AE%D8%B7%D8%A7%D8%A8/1"]
	
	list.each do |main|

		doc = Nokogiri::HTML(open(main))
		doc.css(".prose+table tr p a").each do |a|
			link = "https://ar.wikisource.org" + a.attribute('href').to_s
			# puts a.text.split("(")[0]
			title = a.text.split("(")[0]

			if HadithBook.find_by_title(title).present? && HadithBook.find_by_title(title).narrations.present?
				hb = HadithBook.find_by_title(title)
				global_index = hb.narrations.last.position
			else
				hb = HadithBook.create(title: title, hadith_collection_id: collection.id)
				global_index = 0
			end


			if hb.hadith_chapters.present?
				hc = hb.hadith_chapters.first
			else
				hc = HadithChapter.create(hadith_book_id: hb.id)
			end

			# puts link
			prose = Nokogiri::HTML(open(link))
		    prose.css(".prose p").each_with_index do |hadith, index|
		      global_index = global_index + 1
		      Narration.create(arabic: hadith, hadith_chapter_id: hc.id, position: global_index)      
		      puts hadith
		    end
		end
	end


    # @hadith_book = HadithBook.find_by_title(params[:id])
    # @hadith_book.hadith_chapters.destroy_all
    # @hadith_chapter = HadithChapter.create(hadith_book_id: @hadith_book.id, title: "Ahadith", position: 1)

    # global_index = 0
    # link.split("[split]").each do |url|
    #   doc = Nokogiri::HTML(open(url))
    #   doc.css(".prose p").each_with_index do |hadith, index|
    #     global_index = global_index + 1
    #     Narration.create(arabic: hadith, hadith_chapter_id: @hadith_chapter.id, position: global_index)      
    #     puts hadith
    #   end
    # end

end