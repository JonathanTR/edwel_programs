class Notifier < ActionMailer::Base
  default from: "jonathan.d.reilly@gmail.com"

  def registration_request(fname, lname, email, phone, company, message)
    @fname = fname.capitalize
    @lname = lname.capitalize
    @email = email
    @phone = phone
    @company = company.capitalize
    @message = message
    mail(to: "jonathan.d.reilly@gmail.com", subject: "New registration")
  end

end
