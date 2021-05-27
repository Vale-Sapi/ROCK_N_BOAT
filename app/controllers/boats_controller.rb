class BoatsController < ApplicationController
  before_action :boat_params, only: [:create]
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @boats = Boat.where(location: params[:query])
    else
      @boats = Boat.all
    end
  end

  def show
    # @boat = Boat.find(params[:id])
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

  def edit
  end

  def update
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
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
