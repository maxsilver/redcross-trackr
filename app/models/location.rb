class Location < ActiveRecord::Base
  acts_as_paranoid
  geocoded_by :address
  after_validation :geocode

  attr_accessible :address, :address2, :city, :state_id, :zip,
                  :name, :chapter_id,
                  :contact_name, :contact_phone,
                  :national_shelter_system_identifier,
                  :picture, :picture_cache, :remove_picture

  attr_accessible :address, :address2, :chapter_id, :city, :contact_name, :contact_phone, :name, :national_shelter_system_identifier, :state_id, :zip, :chapter

  validates_presence_of :name, :address, :city, :state, :zip, :chapter
  validates_uniqueness_of :national_shelter_system_identifier, :allow_blank => true

  belongs_to :state
  belongs_to :chapter
  has_many :items, :foreign_key => "current_location_id"

  before_destroy :abort_delete_if_location_has_items

  mount_uploader :picture, PictureUploader

  def full_address
    [address, address2, city, state.name, zip].compact.join(" ")
  end
  
  def containers
    items.joins(:item_type_definition).where("item_type_definitions.kind" => "container")
  end

  def individual_items
    items.joins(:item_type_definition).where("item_type_definitions.kind" => ["single", "multiple"])
  end

private
  def abort_delete_if_location_has_items
    return false if items.any?
  end
end
