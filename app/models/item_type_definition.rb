class ItemTypeDefinition < ActiveRecord::Base
  attr_accessible :name, :quantifiable, :container

  has_many :items
  has_many :item_field_definitions
end
