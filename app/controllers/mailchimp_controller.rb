class MailchimpController < ApplicationController

  def subscribe
    email = params[:email][:address]
    phone = params[:phone][:number]
    if !email.blank?
      begin
        Notifier.registration_request(email, phone).deliver
        @mailchimp.lists.subscribe(@list_id, {'email' => email}, {}, 'html', false)
        render json: { message: "Thank you for registering. A representative will be in touch with shortly to answer your questions."}.to_json
      rescue Mailchimp::ListAlreadySubscribedError 
        format.json{render :json => {:message => "#{email} is already subscribed to the list"}}
      rescue Mailchimp::Error => ex
        if ex.message
          puts '*' * 800
          puts ex
          format.json{render :json => {:message => "An unknown error occurred."}}
        else
          format.json{render :json => {:message => "An unknown error occurred."}}
        end
      end
    else
      format.json{render :json => {:message => "Email Address Cannot be blank. Please enter valid email id."}}
    end
  end

end