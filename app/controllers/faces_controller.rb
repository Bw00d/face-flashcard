class FacesController < ApplicationController
	def new
		@face = Face.new
	end
end