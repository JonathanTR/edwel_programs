require 'mailchimp'

class CoursesController < ApplicationController

  before_action :setup_mailchimp_api

  def show
    @course = Course.friendly.find(params[:id])
    @location = Location.friendly.find(params[:location_id])
    @seminars = Seminar.where(course: @course, location: @location)

    if request.path != location_course_path(@location, @course)
      return redirect_to location_course_path(@location, @course), :status => :moved_permanently
    end
  end

  private

  def setup_mailchimp_api
    @mailchimp = Mailchimp::API.new(ENV["EDWEL_MAILCHIMP_API_KEY"])
    @list_id = ENV["EDWEL_MAILCHIMP_REGISTRATIONS_LIST_ID"]
  end

end