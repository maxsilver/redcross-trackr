class ItemsController < ApplicationController
  before_filter :find_location

  def index
    # @locations = Location.all
  end

  def show
    @item = @location.items.find(params[:id])
  end

  def new
    @item = Item.new(:home_location => location, :current_location => location)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    # @location = Location.new(params[:location])
    # if @location.save
      # redirect_to @location, notice: 'Location was successfully created.'
    # else
      # render action: "new"
    # end
    #

    @item = Item.new(params[:item])

    if @item.save
      redirect_to @location
    else
      render action: "new"
    end

  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to location_item_path(@location, @item), notice: 'Item was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    # @location = Location.find(params[:id])

    # if @location.destroy
    #   redirect_to locations_url
    # else
    #   redirect_to edit_location_path(@location), alert: "Can't delete this location because it has items attached to it."
    # end
  end

  def give
    @errors = []
    @items = [].push @location.items.find(params[:item_id])
    if request.post?
      location = Location.find(params[:item][:location_id])
      container = location.items.find_by_id(params[:item][:container_id])
      @items.zip(params[:quantities]).each do |item, qty|
        if (qty.to_i < item.quantity.to_i) && (qty.to_i > 0)
          old_item = item
          old_item_attributes = old_item.attributes
          old_item_attributes.delete("id")
          old_item_attributes.delete("created_at")
          old_item_attributes.delete("updated_at")
          new_item = Item.new(old_item_attributes)
          old_item.quantity = item.quantity.to_i - qty.to_i
          old_item.save!
          new_item.quantity = qty.to_i
          new_item.give(qty, location, container)
        elsif qty.to_i == item.quantity.to_i
          item.give(qty, location, container)
        elsif qty.to_i < 0
          @errors << [item, "Can't give a negative quantity of items"]
        else
          @errors << [item,"Can't give more items than exist on the item quantity"]
        end
      end
      redirect_to @location, :notice => "Giving completed successfully!" unless @errors.any?
    end
  end

  def lend
    @items = [].push @location.items.find(params[:item_id])
    if request.post?
      location = Location.find(params[:location_id])
      container = Item.containers.find(params[:container_id])
      @items.zip(params[:quantities]).each do |item, qty|
        item.lend(qty, location, container)

      end
      redirect_to @location, :notice => "Lending completed successfully!"
    end
  end

  def find_location
    @location = Location.find(params[:location_id])
  end
end
