class CoursesController < ApplicationController

  def show
    @course = Course.friendly.find(params[:id])
    @location = Location.friendly.find(params[:location_id])
    @seminars = Seminar.where(course: @course, location: @location)

    if request.path != location_course_path(@location, @course)
      return redirect_to location_course_path(@location, @course), :status => :moved_permanently
    end
  end

end