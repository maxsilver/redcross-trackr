class ItemTypeDefinition < ActiveRecord::Base
  attr_accessible :name, :is_containerable

  has_many :items
  has_many :item_field_definitions
end
