class Item < ActiveRecord::Base
  class IsNotContainerableException < RuntimeError; end
  attr_accessible :chapter, :owner, :current_location, :item_type_definition, :item_fields, :quantity

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

end
