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

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      redirect_to @location, notice: 'Location was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to @location, notice: 'Location was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @location = Location.find(params[:id])

    if @location.destroy
      redirect_to locations_url
    else
      redirect_to edit_location_path(@location), alert: "Can't delete this location because it has items attached to it."
    end
  end
end
