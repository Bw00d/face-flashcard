class Mailer < ApplicationMailer
	default from: "Alaska Fire Faces<welcome@fire-faces.herokuapp.com>"
	
  def invitation(invitation)
  	@invitation = invitation
    mail(to: invitation.recipient_email, subject: 'Invitation to Alaska Fire Faces')
  end
end
