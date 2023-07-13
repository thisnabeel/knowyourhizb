# http://www.natadarrab.com/verbs/1230.json

desc "Fetch Sittah"
task :fetch_sittah => :environment do

	# Narrator.all.destroy_all

	require 'csv'    

	csv_text = File.read('lib/all_hadiths_clean.csv')
	csv = CSV.parse(csv_text, :headers => true)
	@n_list = []

	# hadith_collections
	# hadith_books
	# hadith_chapters
	# narration


	# source = hadith_collections
	# hadith_books
	# 

	# list = {
	# 	"id" => ,
	# 	"source" => "", 
	# 	"chapter_no" => "",
	# 	"hadith_no" => "position",
	# 	"chapter" => "",
	# 	"chain_indx" => ,
	# 	"text_ar" => "arabic",
	# 	"text_en" => "english"
	# }

	# # t.integer "position"
 # #    t.integer "hadith_chapter_id"
 # #    t.text    "arabic"
 # #    t.text    "english"
 # #    t.text    "annotated_arabic"

	# # list = {
	# # 	"scholar_indx" => "scholar_index",
	# # 	"name" => "",
	# # 	"grade" => "",
	# # 	"parents" => "",
	# # 	"spouse" => "",
	# # 	"siblings" => "",
	# # 	"children" => "",
	# # 	"birth_date_place" => "",
	# # 	"places_of_stay" => "",
	# # 	"death_date_place" => "",
	# # 	"teachers" => "",
	# # 	"students" => "",
	# # 	"area_of_interest" => "",
	# # 	"tags" => "",
	# # 	"books" => "", 
	# # 	"students_inds" => "students_ids",
	# # 	"teachers_inds" => "teachers_ids",
	# # 	"birth_place" => "",
	# # 	"birth_date" => "",
	# # 	"birth_date_hijri" => "",
	# # 	"birth_date_gregorian" => "",
	# # 	"death_date_hijri" => "",
	# # 	"death_date_gregorian" => "",
	# # 	"death_place" => "",
	# # 	"death_reason" => "",
	# # }


	csv.each_with_index do |row, index|
	  
	  # Collection
	  @hc = HadithCollection.find_or_create_by(title: row["source"])

	  # Book
	  @hb = @hc.hadith_books.find_or_create_by(
		  	title: row["chapter"],
	  		hadith_collection_id: @hc.id,
	  		position: row["chapter_no"]
	  )

	  # Narration
	  n = Narration.create(
  		arabic: row["text_ar"],
  		english: row["text_en"],
  		position: row["hadith_no"],
  		chain: row["chain_indx"],
  		hadith_book_id: @hb.id
  	  )

	  puts n.attributes
	end

	# puts @n_list.first.keys

end