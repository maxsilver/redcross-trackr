class Chapter < ActiveRecord::Base
  attr_accessible :name, :code, :region_id
  
  validates_presence_of :name, :code, :region
  
  belongs_to :region
end
