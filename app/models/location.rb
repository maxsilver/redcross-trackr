class Location < ActiveRecord::Base
  attr_accessible :name, :chapter_id, :chapter

  belongs_to :chapter
end
