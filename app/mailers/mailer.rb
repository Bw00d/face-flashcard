class Mailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.invitation.subject
  #
  def invitation(invitation)
  	@greeting = "You have been invited to join Fire Faces. Visit "

    mail to: invitation.recipient_email
  end
end
