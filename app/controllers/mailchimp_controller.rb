class MailchimpController < ApplicationController

  def subscribe
    email = params[:email][:address]
    if !email.blank?
      begin
        @mailchimp.lists.subscribe(@list_id, {'email' => email}, {}, 'html', false)
        render json: { message: "Thank you for registering. A representative will be in touch with you shortly to discuss class details and answer your questions."}.to_json
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