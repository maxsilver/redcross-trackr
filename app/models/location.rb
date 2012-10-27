class Location < ActiveRecord::Base
  attr_accessible :address, :address2, :chapter_id, :city, :contact_name, :contact_phone, :name, :national_shelter_system_identifier, :state_id, :zip, :chapter
  validates_presence_of :name, :address, :city, :state, :zip, :chapter
  belongs_to :state
  belongs_to :chapter
end
