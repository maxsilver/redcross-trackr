class ItemFieldDefinition < ActiveRecord::Base
  attr_accessible :name, :kind, :required, :unique, :item_type_definition_id, :label, :item_type_definition

  belongs_to :item_type_definition

  def kind_enum
    ["string", "number", "date"]
  end
end
