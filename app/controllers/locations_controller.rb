class LocationsController < ApplicationController

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
    @location = current_user.locations.build(location_params)

    if @location.save
      redirect_to @location, notice: "Court created successfully!"
    else
      render "new"
    end
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
