class Location < ActiveRecord::Base
  attr_accessible :address, :address2, :chapter_id, :city, :contact_name, :contact_phone, :name, :national_shelter_system_identifier, :state_id, :zip
  validates_presence_of :name, :address, :city, :state, :zip, :chapter
  validates_uniqueness_of :national_shelter_system_identifier
  belongs_to :state
  belongs_to :chapter
end
