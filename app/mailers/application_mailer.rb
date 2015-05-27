class ApplicationMailer < ActionMailer::Base
  default from: "Alaska Fire Faces<welcome@fire-faces.herokuapp.com>"
  layout 'mailer'
end
