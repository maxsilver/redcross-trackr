class Location < ActiveRecord::Base
  acts_as_paranoid
  geocoded_by :address
  after_validation :geocode

  attr_accessible :address, :address2, :city, :state_id, :zip,
                  :name, :chapter_id,
                  :contact_name, :contact_phone,
                  :national_shelter_system_identifier,
                  :picture, :picture_cache, :remove_picture

  validates_presence_of :name, :address, :city, :state, :zip, :chapter
  validates_uniqueness_of :national_shelter_system_identifier

  belongs_to :state
  belongs_to :chapter

  mount_uploader :picture, PictureUploader
  
  def full_address
    [address, address2, city, state.name, zip].compact.join(" ")
  end
end
