class FacesController < ApplicationController
	def new
		@face = Face.new
	end

	def index
		@faces = Face.paginate(:page => params[:page], per_page: 30).order('created_at DESC')
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
			redirect_to faces_path(@face)
		else
			redirect_to :back
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

	def learn
		offset = rand(Face.count)
		@face = Face.offset(offset).first
	end

	private

	def face_params
		params.require(:face).permit(:name, :agency, :avatar)
	end
end