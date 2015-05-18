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

	def edit
		@face = Face.find(params[:id])
	end

	def update
		@face = Face.find(params[:id])
		if @face.update_attributes(face_params)
		  flash.now[:success] = "Face Updated!"
			redirect_to @face
		else
			render 'edit'
		end
		# 	respond_to do |format|
		# 		# flash.now[:success] = "face updated!"
		# 		format.html  { redirect_to @face }
		# 		# format.json { respond_with_bip(@face) }
		# 	end
		# else
		# 	render 'edit'
		# end
	end

	private

	def face_params
		params.require(:face).permit(:name, :agency)
	end
end