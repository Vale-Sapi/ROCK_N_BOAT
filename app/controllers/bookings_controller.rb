class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_boat, only: [:show, :new, :create]

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.boat = @boat
    if @booking.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to boat_path(@booking.boat)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end
end
