class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.friendly.find(params[:id])
    if request.path != location_path(@location)
      return redirect_to @location, :status => :moved_permanently
    end
  end

end