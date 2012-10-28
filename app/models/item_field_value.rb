class ItemFieldValue < ActiveRecord::Base
  attr_accessible :item_field_definition_id, :item_id, :value

  def label
    item_field_definition.name
  end
end
