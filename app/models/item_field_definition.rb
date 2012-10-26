class ItemFieldDefinition < ActiveRecord::Base
  attr_accessible :label, :type, :item_type_definition

  belongs_to :item_type_definition
end
