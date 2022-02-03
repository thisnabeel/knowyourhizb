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
				Scripture.find_or_create_by(title: f["title"].strip, cult_id: c.id)
				Term.find_or_create_by(title: f["title"].strip, cult_id: c.id)
				Trigger.find_or_create_by(title: f["title"].strip, cult_id: c.id)
			end
		end
	end
	
end
