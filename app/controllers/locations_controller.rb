class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    if @location.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :description, :style, :daily_fee)
  end

end
