class Chapter < ActiveRecord::Base
  attr_accessible :code, :name, :region

  has_one :region
end
