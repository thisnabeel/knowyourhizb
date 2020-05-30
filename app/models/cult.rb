class Cult < ActiveRecord::Base
	has_many :cults
	belongs_to :cult
	serialize :technical_terms
	serialize :scriptures
	serialize :triggers
	serialize :figures
end
