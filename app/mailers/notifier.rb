class Notifier < ActionMailer::Base
  default from: "jonathan.d.reilly@gmail.com"

  def registration_request(email, phone, company, message)
    @email = email
    @phone = phone
    @company = company
    @message = message
    mail(to: "jonathan.d.reilly@gmail.com", subject: "New registration")
  end

end
