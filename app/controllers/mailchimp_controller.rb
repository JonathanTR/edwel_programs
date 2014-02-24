class MailchimpController < ApplicationController

  def subscribe
    fname = params[:name][:first_name]
    lname = params[:name][:last_name]
    email = params[:email][:address]
    phone = params[:phone][:number]
    company = params[:company][:name]
    message = params[:message][:text]
    if !email.blank?
      begin
        Notifier.registration_request(fname, lname, email, phone, company, message).deliver
        @mailchimp.lists.subscribe(@list_id, {'email' => email}, {'fname' => fname, 'lname' => lname, 'phone' => phone, 'company' => company}, 'html', false)
        render json: { message: "Thank you for registering. A representative will be in touch with shortly to answer your questions."}.to_json
      rescue Mailchimp::ListAlreadySubscribedError 
        render json: {:message => "#{email} is already subscribed to the list"}.to_json
      rescue Mailchimp::ListMergeFieldRequiredError
        render json: {:message => "Please fill out all the required fields"}.to_json
      rescue Mailchimp::Error => ex
        if ex.message
          puts '*' * 100
          puts ex
          render json: {:message => "An unknown error occurred."}.to_json
        else
          render json: {:message => "An unknown error occurred."}.to_json
        end
      end
    else
      render json: {:message => "Email Address Cannot be blank. Please enter valid email id."}.to_json
    end
  end

end