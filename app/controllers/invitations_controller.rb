class InvitationsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  
	def new
		@invitation = Invitation.new
	end

	def create
    @invitation = Invitation.new(invitation_params)
    @invitation.sender = current_user
    if @invitation.save
      Mailer.invitation(@invitation).deliver_later
      flash[:notice] = "Thank you, invitation sent."
      redirect_to faces_path
    else
      render :action => 'new'
    end
  end
  def update
    @invitation = Invitation.find(params[:id])
    @invitation.update_attributes(face_params)
  end

  private
  def invitation_params
  	params.require(:invitation).permit(:recipient_email, :token)	
  end

  def signed_in_user
    unless user_signed_in?
      redirect_to new_user_session_path, notice: "Please sign in."
    end
  end
end