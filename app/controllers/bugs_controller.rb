class BugsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy]

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.create(bug_params)
    if @bug.save
      flash[:notice] = "Thank you for reporting that issue. We will look into it."
      redirect_to root_url
    else
      redirect_to :back
    end
  end

  def index
    @bugs = Bug.paginate(:page => params[:page], per_page: 15)
  end

  def update
		@bug = Bug.find(params[:id])
    @bug.update(bug_params)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js   { render nothing: true }
    end
	end

  private

  def bug_params
    params.require(:bug).permit(:message, :fixed)
  end

  def signed_in_user
    unless user_signed_in?
      redirect_to new_user_session_path, notice: "Please sign in."
    end
  end
end
