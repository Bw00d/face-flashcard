class Mailer < ApplicationMailer
	default from: "Welcome<alaska@fire-faces.herokuapp.com>"
	
  def invitation(invitation)
  	@invitation = invitation
    mail(to: invitation.recipient_email, subject: 'Invitation to Alaska Fire Faces')
  end
end
