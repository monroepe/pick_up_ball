class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def location_params
    params.require(:location).permit(:name, :description, :address, :city, :state, :zip_code)
  end

end
