class FacesController < ApplicationController
	def new
		@face = Face.new
	end

	def index
		@faces = Face.all
	end

	def show
		@face = Face.find(params[:id])
	end

	def create
		@face = Face.create(face_params)
		if @face.save
			flash[:notice] = "That face was added."
			redirect_to @face
		else
			render 'new'
		end
	end

	private

	def face_params
		params.require(:face).permit(:name, :agency)
	end
end