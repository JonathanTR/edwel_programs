class Notifier < ActionMailer::Base
  default from: "jonathan.d.reilly@gmail.com"

  def registration_request(email)
    mail(to: email, subject: "test")
  end

end
