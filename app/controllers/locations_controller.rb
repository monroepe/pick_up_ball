class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @locations = Location.search(params[:search]).order(:name).page(params[:page])
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
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to @location, notice: "Court updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @location = Location.find(params[:id])

    @location.destroy

    redirect_to locations_path, notice: "Court deleted successfully!"
  end

  private

  def location_params
    params.require(:location).permit(:name, :description, :address, :city, :state)
  end

end
