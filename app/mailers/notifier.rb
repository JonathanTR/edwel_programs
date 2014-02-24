class Notifier < ActionMailer::Base
  default from: "jonathan.d.reilly@gmail.com"

  def registration_request(email, phone, company)
    @email = email
    @phone = phone
    @company = company
    mail(to: "jonathan.d.reilly@gmail.com", subject: "test")
  end

end
