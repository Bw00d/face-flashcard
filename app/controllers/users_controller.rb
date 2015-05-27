class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :admin_only, only: [:index ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :root
      flash[:alert] = "You don't have authorization to view that page!"
    end
  end
end
