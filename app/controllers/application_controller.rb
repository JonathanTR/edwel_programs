require 'mailchimp'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup_mailchimp_api

  private

  def setup_mailchimp_api
    @mailchimp = Mailchimp::API.new(ENV["EDWEL_MAILCHIMP_API_KEY"])
    @list_id = ENV["EDWEL_MAILCHIMP_REGISTRATIONS_LIST_ID"]
  end

end
