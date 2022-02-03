class Cult < ActiveRecord::Base
	has_many :cults
	belongs_to :cult
	has_many :terms
	has_many :scriptures
	has_many :triggers
	has_many :figures

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
	
end
