class Narrator < ActiveRecord::Base
	
	has_many :narrator_narrations

	def self.find_chain(chain)
		array = []
		chain.split(", ").each do |c|
			array.push(Narrator.where(scholar_index: c).try(:first))
		end
		return array
	end

	def narrations
		# list = []
		# Narration.all.each do |n|
		# 	if n.chain.present?
		# 		if n.chain.include? self.id.to_s
		# 			list.push(n)
		# 		end
		# 	end
		# end
		# return list
		return Narration.all.where("chain like ?", "%#{self.scholar_index}%")
	end
end
