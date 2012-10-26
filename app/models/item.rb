class Item < ActiveRecord::Base
  attr_accessible :chapter, :location, :item_type_definition, :item_fields, :quantity


  # the chapter that "owns" this item
  belongs_to :chapter

  # the location it currently resides at
  belongs_to :location


  belongs_to :item_type_definition
  has_many :item_fields

end
