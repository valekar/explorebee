class UserTripsController < ApplicationController
  def index

    @trips = current_user.trips.paginate(page: params[:page], :per_page => 3)


  end
end
