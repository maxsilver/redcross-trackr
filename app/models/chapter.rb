class Chapter < ActiveRecord::Base
  attr_accessible :name, :region

  belongs_to :region
  has_many :locations
end
