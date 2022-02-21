class Cult < ActiveRecord::Base
	has_many :cults
	belongs_to :cult
	has_many :terms
	has_many :scriptures
	has_many :triggers
	has_many :figures


	after_commit :flush_cache

	after_create :set_position


  	def self.all_cached
        return Rails.cache.fetch('cults') {
            Cult.all.to_json( :include => [:cults])
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
	
	
	def self.rehash
		Cult.all.each do |c|
			c.figures.try(:each) do |f|
				Figure.find_or_create_by(title: f["title"].strip, cult_id: c.id)
			end

			c.scriptures.try(:each) do |f|
				Scripture.find_or_create_by(title: f["title"].strip, cult_id: c.id)
			end

			c.technical_terms.try(:each) do |f|
				Term.find_or_create_by(title: f["title"].strip, cult_id: c.id)
			end

			c.triggers.try(:each) do |f|
				Trigger.find_or_create_by(title: f["title"].strip, cult_id: c.id)
			end
		end
	end

	def self.recache
		Rails.cache.delete('cults')
	end

	private
        
    def flush_cache
        Rails.cache.delete('cults')
    end

	
end
