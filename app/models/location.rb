class Location < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :address, :address2, :chapter_id,
                  :city, :contact_name, :contact_phone,
                  :name, :national_shelter_system_identifier,
                  :state_id, :zip,
                  :picture, :picture_cache, :remove_picture

  validates_presence_of :name, :address, :city, :state, :zip, :chapter
  validates_uniqueness_of :national_shelter_system_identifier

  belongs_to :state
  belongs_to :chapter

  mount_uploader :picture, PictureUploader
end
