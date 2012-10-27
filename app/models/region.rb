class Region < ActiveRecord::Base
  attr_accessible :name, :code
  
  validates_presence_of :name, :code

  has_many :chapters
end
