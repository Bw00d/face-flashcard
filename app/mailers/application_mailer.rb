class ApplicationMailer < ActionMailer::Base
  default from: "welcome@fire-faces.herokuapp.com"
  layout 'mailer'
end
