# http://www.natadarrab.com/verbs/1230.json

desc "Fetch Rawis"
task :fetch_rawis => :environment do

	Narrator.all.destroy_all

	require 'csv'    

	csv_text = File.read('lib/all_rawis.csv')
	csv = CSV.parse(csv_text, :headers => true)
	@n_list = []

	list = {
		"scholar_indx" => "scholar_index",
		"name" => "",
		"grade" => "",
		"parents" => "",
		"spouse" => "",
		"siblings" => "",
		"children" => "",
		"birth_date_place" => "",
		"places_of_stay" => "",
		"death_date_place" => "",
		"teachers" => "",
		"students" => "",
		"area_of_interest" => "",
		"tags" => "",
		"books" => "", 
		"students_inds" => "students_ids",
		"teachers_inds" => "teachers_ids",
		"birth_place" => "",
		"birth_date" => "",
		"birth_date_hijri" => "",
		"birth_date_gregorian" => "",
		"death_date_hijri" => "",
		"death_date_gregorian" => "",
		"death_place" => "",
		"death_reason" => "",
	}

	csv.each_with_index do |row, index|
	  @n_list.push(row.to_hash)
	  hash = {}
	  list.each do |l|
	  	if list[l[0]] == "" || list[l[0]] == nil
	  		hash[l[0]] = row[l[0]]
	  	else
	  		hash[l[1]] = row[l[0]]
	  	end
	  end
	  n = Narrator.create(hash)
	  puts index
	end

	# puts @n_list.first.keys

end