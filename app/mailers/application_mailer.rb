class ApplicationMailer < ActionMailer::Base
  default from: "Welcome<alaska@fire-faces.herokuapp.com>"
  layout 'mailer'
end
