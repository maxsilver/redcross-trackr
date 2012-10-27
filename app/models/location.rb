class Location < ActiveRecord::Base
  attr_accessible :address, :address2, :chapter_id, :city, :contact_name, :contact_phone, :name, :national_shelter_system_identifier, :state_id, :zip
  validates_presence_of :name, :address, :city, :state, :zip, :chapter
  validates_uniqueness_of :national_shelter_system_identifier
  validates_format_of :contact_phone, 
                      :with => /\A[0-9]{10}\Z/, 
                      :allow_blank => true, 
                      :allow_nil => true
  belongs_to :state
  belongs_to :chapter
end
