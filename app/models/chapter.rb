class Chapter < ActiveRecord::Base
  attr_accessible :name, :code
  
  validates_presence_of :name, :code, :region
  
  belongs_to :region
end
