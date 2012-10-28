class Location < ActiveRecord::Base
  acts_as_paranoid
  geocoded_by :full_address
  after_validation :geocode

  attr_accessible :address, :address2, :city, :state_id, :zip,
                  :name, :description, :chapter_id, :state,
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

  def contact?
    contact_name.present? or contact_phone.present?
  end

  def number_of_items_of_type(item_type_definition)
    items.of_type(item_type_definition).sum("quantity")
  end

private
  def abort_delete_if_location_has_items
    return false if items.any?
  end
end
