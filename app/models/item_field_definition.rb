class ItemFieldDefinition < ActiveRecord::Base
  attr_accessible :label, :kind, :required, :unique, :item_type_definition_id

  belongs_to :item_type_definition
  
  def kind_enum
    ["string", "number", "date"]
  end
end
