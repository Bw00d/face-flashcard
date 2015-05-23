class InvitationsController < ApplicationController

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
end