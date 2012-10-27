class FleshOutItemAndFieldDefinitions < ActiveRecord::Migration
  def change
    add_column :item_type_definitions, :quantifiable, :boolean
    add_column :item_type_definitions, :container, :boolean
    add_column :item_field_definitions, :required, :boolean
    add_column :item_field_definitions, :unique, :boolean
    
    rename_column :item_field_definitions, :type, :kind
  end
end