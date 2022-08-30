class PagesController < ApplicationController
	def home
		@cults = Cult.all_cached
	end

	def timeline
	end
end