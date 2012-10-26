class CreateItemFieldDefinitions < ActiveRecord::Migration
  def change
    create_table :item_field_definitions do |t|
      t.string :label
      t.string :type
      t.integer :item_type_definition_id
      t.timestamps
    end
  end
end
