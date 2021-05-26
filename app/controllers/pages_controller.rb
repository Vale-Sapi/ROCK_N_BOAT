class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @boats = Boat.all
    @bookings = Booking.all
  end
end
