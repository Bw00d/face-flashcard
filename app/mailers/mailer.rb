class Mailer < ApplicationMailer
	default from: "from@example.com"
	
  def invitation(invitation)
  	@invitation = invitation
    mail(to: invitation.recipient_email, subject: 'Invitation to Fire Faces')
  end
end
