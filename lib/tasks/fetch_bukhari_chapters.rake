# http://www.natadarrab.com/verbs/1230.json

desc "Fetch From Bukhari"
task :fetch_bukhari_chapters => :environment do
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
	
	HadithChapter.all.destroy_all
	Narration.all.destroy_all
	

	problems = []

	i = 1
	while i < 98

		url = "https://sunnah.com/bukhari/" + i.to_s
		
		result = []

		doc = Nokogiri::HTML(open(url))
		doc.css(".chapter").each_with_index do |chapter, index|

			if chapter.next_element.attr('class').include? "achapintro"
				notes = chapter.next_element.text
			elsif chapter.next_element.attr('class').include? "echapintro"
				notes = chapter.next_element.next_element.text
			end

			# arabic_hadith_full arabic

			ahadith = []

			# error handle
			begin
			   fetch = collect_between(doc.css(".chapter")[index], doc.css(".chapter")[index + 1])
			rescue
			   puts "Problem with book #{i}"
			   problems.push(i)
			else
			    
			    fetch = collect_between(doc.css(".chapter")[index], doc.css(".chapter")[index + 1])

				fetch.each do |f|

					if f != nil 
						if f.to_html.include? 'actualHadithContainer'
							ahadith.push(f.css(".arabic_hadith_full").text)
						end
					end
				end

			end



			v = {
				"number" => index + 1,
				"title" => chapter.css(".arabicchapter").text,
				"notes" => notes,
				"hadith" => ahadith
			}
			
			book_id = HadithBook.where(position: i).first.id
			h = HadithChapter.create(hadith_book_id: book_id, title: v["title"], notes: v["notes"])
			
			ti = 1
			v["hadith"].each do |hadith| 
				Narration.create(hadith_chapter_id: h.id, position: ti, arabic: hadith)
				ti = ti + 1
			end
		end

		# fetch = collect_between(doc.css(".chapter")[1], doc.css(".chapter")[2])
		# v = []

		# fetch.each do |f|
		# 	if f.to_html.include? 'actualHadithContainer'
		# 		v.push(f.css(".arabic_hadith_full").text)
		# 	end
		# end

		# @b = v

		@result = result

		i = i + 1

		puts "Done with Book #{i}"
	end

	puts "COMPLETE! Mabrook!"
	puts "Also... There were problems in these books, you might wanna take a look:"
	problems.each do |p|
		puts "Problem: Chapter #{p}"
	end

end

def collect_between(first, last)
  first == last ? [first] : [first, *collect_between(first.next, last)]
end