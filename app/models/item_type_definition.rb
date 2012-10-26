class ItemTypeDefinition < ActiveRecord::Base
  attr_accessible :name

  has_many :items
  has_many :item_field_definitions
end
