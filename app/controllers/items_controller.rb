class ItemsController < ApplicationController
  before_filter :find_location

  def index
    # @locations = Location.all
  end

  def show
    @item = @location.items.find(params[:id])
  end

  def new
    @item = Item.new(:current_location => location)
    # @location = Location.new
  end

  def edit
    # @location = Location.find(params[:id])
  end

  def create
    # @location = Location.new(params[:location])
    # if @location.save
      # redirect_to @location, notice: 'Location was successfully created.'
    # else
      # render action: "new"
    # end
    #
    binding.pry
    @item = Item.new(params[:item])
    if @item.save
      redirect_to @location
    else
    end

  end

  def update
    # @location = Location.find(params[:id])
    # if @location.update_attributes(params[:location])
    #   redirect_to @location, notice: 'Location was successfully updated.'
    # else
    #   render action: "edit"
    # end
  end

  def destroy
    # @location = Location.find(params[:id])

    # if @location.destroy
    #   redirect_to locations_url
    # else
    #   redirect_to edit_location_path(@location), alert: "Can't delete this location because it has items attached to it."
    # end
  end

  def move
    @location = Location.find(params[:location_id])
    @items = @location.items.find(params[:item_ids])
    if request.put?
      location = Location.find(params[:location_id])
      container = Container.find(params[:container_id])
      @items.zip(params[:quantities]).each do |item, qty|
        item.move(qty, location, container)
      end
    end
  end

  def lend
    @location = Location.find(params[:location_id])
    @items = @location.items.find(params[:item_ids])
    if request.put?
      location = Location.find(params[:location_id])
      container = Container.find(params[:container_id])
      @items.zip(params[:quantities]).each do |item, qty|
        item.lend(qty, location, container)
      end
    end
  end

  def find_location
    @location = Location.find(params[:location_id])
  end
end
