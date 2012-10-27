class Item < ActiveRecord::Base
  class IsNotContainerableException < RuntimeError; end

  attr_accessible :name, :item_type_definition_id, :owner_id, :location_id, :quantity

  # the chapter that "owns" this item
  belongs_to :owner, :class_name => "Location", :foreign_key => "owner_id"

  # the location it currently resides at
  belongs_to :current_location, :class_name => "Location", :foreign_key => "location_id"
  has_many :contained_items, :class_name => "Item"

  belongs_to :item_type_definition
  has_many :item_fields

  delegate :is_containerable, :to => :item_type_definition

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
