class Notifier < ActionMailer::Base
  default from: "jonathan.d.reilly@gmail.com"

  def registration_request(email, phone)
    @email = email
    @phone = phone
    mail(to: "jonathan.d.reilly@gmail.com", subject: "test")
  end

end
