class FacesController < ApplicationController
	before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy]

	def new
		@face = Face.new
	end

	def index
		if params[:search]
      @faces = Face.search(params[:search])
			# @names = Face.paginate(:page => params[:page], per_page: 100).order(:name)
			@names = Face.all.order(:name)
    else
			# @faces = Face.paginate(:page => params[:page], per_page: 60).order('created_at DESC')
			# @names = Face.paginate(:page => params[:page], per_page: 100).order(:name)
			@faces = Face.all
			@names = Face.all.order(:name)
		end
	end

	def show
		@face = Face.find(params[:id])
	end

	def create
		@face = Face.create(face_params)
		if @face.save
			flash[:notice] = "That card was added."
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
		  flash.now[:success] = "Card Updated!"
			redirect_to faces_path(@face)
		else
			redirect_to :back
		end
	end

	def destroy
		face = Face.find(params[:id])
    face.destroy
    flash[:success] = "Card deleted."
    redirect_to faces_path
	end

	def learn
		@choices = Face.all.sample(3)
		@face = @choices.first
	end


	private

	def face_params
		params.require(:face).permit(:name, :agency, :avatar, :created_by, :edited_by, :position)
	end

	def signed_in_user
  	unless user_signed_in?
  	  redirect_to new_user_session_path, notice: "Please sign in."
  	end
  end
end