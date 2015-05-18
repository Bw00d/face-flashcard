class FacesController < ApplicationController
	def new
		@face = Face.new
	end

	private

	def face_params
		params.require(:face).permit(:name, :agency)
	end
end