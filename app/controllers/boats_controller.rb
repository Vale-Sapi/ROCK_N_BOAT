class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :destroy]

  def index
    @boats = Boat.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def destroy
    @boat.destroy
    redirect_to boats_path
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :price, :details, :location)
  end
end
