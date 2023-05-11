class Cult < ActiveRecord::Base
	has_many :cults
	belongs_to :cult
	has_many :terms
	has_many :scriptures
	has_many :triggers
	has_many :figures


	after_commit :flush_cache

	after_create :set_position

	belongs_to :parent, class_name: "Cult", foreign_key: "cult_id"
  	has_many :children, class_name: "Cult", foreign_key: "cult_id"
	
	def tree
		Rails.cache.fetch([self, "tree"]) do
			current_cult = self
			ancestry_path = [current_cult.title]

			while current_cult.parent
			current_cult = current_cult.parent
			ancestry_path.unshift(current_cult.title)
			end

			ancestry_path.reverse
		end
	end

	def self.reverse_breadcrumbs
		cults = Cult.all
		cults_by_id = cults.index_by { |c| c[:id] }

		# Next, build a hash to hold the reversed traversals
		traversals = {}

		# Iterate over each cult and build its reversed traversal
		cults.each do |cult|
			traversal = []
			current_cult = cults_by_id[cult[:id]]

			# Traverse up the ancestry chain until we reach the root
			while current_cult
				traversal << current_cult.title
				current_cult = cults_by_id[current_cult[:cult_id]]
			end

			# Add the reversed traversal to the hash, keyed by the cult's id
			traversals[cult[:id]] = traversal
		end

		traversals
	end

  	def self.all_cached
        return Rails.cache.fetch('cults') {
			Cult.all.order("release_date ASC").map {|c|
				c.attributes.merge(
					figures: c.figures,
					terms: c.terms,
					scriptures: c.scriptures,
					triggers: c.triggers
				)
			}
        }
	end


	def set_position
		begin 
			chapters_list = self.cults
			if chapters_list.count > 1 && chapters_list.present?
				self.update_attributes(position: chapters_list.count)
			else
				self.update_attributes(position: 1)
			end
		rescue
		end
	end
	
	
	# def self.rehash
	# 	Cult.all.each do |c|
	# 		c.figures.try(:each) do |f|
	# 			Figure.find_or_create_by(title: f["title"].strip, cult_id: c.id)
	# 		end

	# 		c.scriptures.try(:each) do |f|
	# 			Scripture.find_or_create_by(title: f["title"].strip, cult_id: c.id)
	# 		end

	# 		c.technical_terms.try(:each) do |f|
	# 			Term.find_or_create_by(title: f["title"].strip, cult_id: c.id)
	# 		end

	# 		c.triggers.try(:each) do |f|
	# 			Trigger.find_or_create_by(title: f["title"].strip, cult_id: c.id)
	# 		end
	# 	end
	# end

	def self.recache
		Rails.cache.delete('cults')
		Cult.all_cached
	end

	private
        
    def flush_cache
        Rails.cache.delete('cults')
    end



	
end
