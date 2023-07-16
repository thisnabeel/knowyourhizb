class Narration < ActiveRecord::Base

	belongs_to :hadith_chapter
	belongs_to :hadith_book
	has_many :resources, as: :resourceable
	has_many :narrator_narrations


	has_many :conclusions

	def reset_narration
		self.update(annotated_arabic: nil)
	end

	def self.bulk_add_narrator(name)

		prefixes = [
			"حَدَّثَنَا ", 
			"حَدَّثَنَا ", 
			"حَدَّثَنِي ",
			"حَدَّثَنِي",  
			"قَالَ أَخْبَرَنِي ", 
			"فَأَخْبَرَنِي ", 
			"َأَخْبَرَنِي ", 
			"أَخْبَرَنَا ", 
			"قَالَ ", 
			"قَالَتْ ",
			"سَأَلَ ",
			"عَنِ ", 
			"عَنْ ", 
			"أَنَّ ", 
			"سَمِعْتُ ", 
			"سَمِعَ "
		]

		n = HadithCollection.first.narrations

		ahadith = n.where("arabic like ?", "%#{name}%")

		filtered_name = name
		prefixes.each do |p|
			filtered_name = filtered_name.gsub(p, "")
		end

		ahadith.each do |h|

			original = h.arabic

			if h.annotated_arabic.present?
				annot = h.annotated_arabic

				if annot.include? '<span class="narrator id-this">'+filtered_name+'</span>'
				else
					new_version = annot.gsub!(filtered_name, '<span class="narrator id-this">'+filtered_name+'</span>')
					h.update(annotated_arabic: new_version)
				end
			else
				h.update(annotated_arabic: original)
				annot = h.annotated_arabic
				new_version = annot.gsub!(filtered_name, '<span class="narrator id-this">'+filtered_name+'</span>')
				h.update(annotated_arabic: new_version)
			end

		end

	end

	def self.remove_narrator(id, name)
		# <span class=\"narrator id-this\">عَبْدُ اللَّهِ بْنُ يُوسُفَ</span>
		hadith = Narration.find(id)
		sweep = hadith.annotated_arabic.gsub("<span class=\"narrator id-this\">#{name}</span>", "#{name}")
		hadith.update(annotated_arabic: sweep)
		# return sweep
	end

	def find_chain
		array = []
		self.chain.split(", ").each do |c|
			array.push(Narrator.find_by_scholar_index(c))
		end
		return array
	end

end
