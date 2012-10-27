class Item < ActiveRecord::Base
  class IsNotContainerableException < RuntimeError; end

  attr_accessible :name, :quantity, :container_id,
                  :item_type_definition_id, :home_location_id, :current_location_id,
                  :picture, :picture_cache, :remove_picture, :item_type_definition,
                  :current_location, :home_location

  belongs_to :item_type_definition
  belongs_to :home_location, :class_name => "Location"
  belongs_to :current_location, :class_name => "Location"
  belongs_to :container, :class_name => "Item"

  # has_many :contained_items, :class_name => "Item"
  # has_many :item_fields

  mount_uploader :picture, PictureUploader

  validates_presence_of :name
  
  scope :containers, joins(:item_type_definition).where("item_type_definitions.kind" => "container")
  scope :individuals, joins(:item_type_definition).where("item_type_definitions.kind != 'container'")
  scope :of_type, lambda { |item_type_definition| where(:item_type_definition_id => item_type_definition.id) }

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

  def move(options)
    if options[:quantity] == self.quantity
      self.update_attributes!(
        home_location: options[:new_location],
        current_location: options[:new_location]
      )
    else
      decrease_quantity_by(options[:quantity])
      Item.create!(
        name: self.name,
        item_type_definition: self.item_type_definition,
        quantity: options[:quantity],
        home_location: options[:new_location],
        current_location: options[:new_location]
      )
    end
  end

  def decrease_quantity_by(amount)
    self.quantity -= amount
    save!
  end

  def lend(qty, location, container)
    raise "Too Many" if qty > self.quantity

    if qty == self.quantity
      self.current_location = location
      self.container = container
    else
      self.quantity -= qty
      
      moved_item = Item.new(item.attributes.merge(:quantity => qty))
      moved_item.current_location = location
      moved_item.container = container
      moved_item.save!
    end
    self.save!
  end
end
