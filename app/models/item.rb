class Item < ActiveRecord::Base
  class IsNotContainerableException < RuntimeError; end

  attr_accessible :name, :quantity, :container_id,
                  :item_type_definition_id, :home_location_id, :current_location_id,
                  :picture, :picture_cache, :remove_picture, :item_type_definition, :current_location

  belongs_to :item_type_definition
  belongs_to :home_location, :class_name => "Location"
  belongs_to :current_location, :class_name => "Location"
  belongs_to :container, :class_name => "Item"

  # has_many :contained_items, :class_name => "Item"
  # has_many :item_fields

  mount_uploader :picture, PictureUploader

  def at_home?
    current_location == home_location
  end

  def items
    if is_containerable
      contained_items
    else
      []
    end
  end

  def give_to(new_location)
    owner = new_location
    current_location = new_location
    save!
  end

  def lend_to(new_location)
    current_location = new_location
    save!
  end
end
