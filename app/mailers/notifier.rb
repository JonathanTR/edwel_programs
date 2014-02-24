class Notifier < ActionMailer::Base
  default from: "jonathan.d.reilly@gmail.com"

  def registration_request(fname, lname, email, phone, company, message)
    @fname = fname
    @lname = lname
    @email = email
    @phone = phone
    @company = company
    @message = message
    mail(to: "jonathan.d.reilly@gmail.com", subject: "New registration")
  end

end
