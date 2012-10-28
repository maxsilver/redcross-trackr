class Item < ActiveRecord::Base
  class IsNotContainerableException < RuntimeError; end

  attr_accessible :name, :quantity, :container_id, :item_id, :description,
                  :item_type_definition_id, :home_location_id, :current_location_id,
                  :picture, :picture_cache, :remove_picture, :item_type_definition,
                  :current_location, :home_location, :item_field_values_attributes


  belongs_to :item_type_definition
  belongs_to :home_location, :class_name => "Location"
  belongs_to :current_location, :class_name => "Location"
  belongs_to :container, :class_name => "Item"

  # has_many :contained_items, :class_name => "Item"
  # has_many :item_fields

  has_many :item_field_values
  accepts_nested_attributes_for :item_field_values

  delegate :item_type_fields, :to => :item_type_definition

  mount_uploader :picture, PictureUploader

  validates_presence_of :name

  scope :containers, joins(:item_type_definition).where("item_type_definitions.kind_id" => Kind.find_by_name("container").id)
  scope :individuals, joins(:item_type_definition).where("item_type_definitions.kind_id != " + Kind.find_by_name("container").id.to_s)
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

  def move_some_items_to(location, options)
    decrease_quantity_by(options[:quantity])
    Item.create!(
      name: self.name,
      item_type_definition: self.item_type_definition,
      quantity: options[:quantity],
      home_location: location,
      current_location: location
    )
  end

  def decrease_quantity_by(amount)
    self.quantity -= amount
    save!
  end

  def give_all_items_to(location)
    self.update_attributes!(home_location: location, current_location: location)
  end

  def lend_all_items_to(location)
    self.update_attributes!(current_location: location)
  end

  def give(qty, location, container)
    if container.is_a?(Item)
      give_all_items_to(container.current_location)
      self.owner = container.current_location
      self.current_location = container.current_location
      self.container = container
    elsif container.is_a?(Location)
      give_all_items_to(location)
      self.owner = location
      self.current_location = location
      self.container = nil
    else
      give_all_items_to(location)
      self.owner = location
      self.current_location = location
      self.container = nil
    end
    save!
  end

  def lend(qty, location, container)
    if container.is_a?(Item)
      lend_all_items_to(container.current_location)
      self.current_location = container.current_location
      self.container = container
    elsif container.is_a?(Location)
      lend_all_items_to(location)
      self.current_location = location
      self.container = nil
    else
      lend_all_items_to(location)
      self.current_location = location
      self.container = nil
    end
    save!
  end


end
