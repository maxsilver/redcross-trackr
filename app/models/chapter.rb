class Chapter < ActiveRecord::Base
  attr_accessible :name, :code, :region_id, :region

  validates_presence_of :name, :code, :region

  belongs_to :region
  has_many :locations
end
