class CreateItemFieldValues < ActiveRecord::Migration
  def change
    create_table :item_field_values do |t|
      t.integer :item_id
      t.integer :item_field_definition_id
      t.string :value

      t.timestamps
    end
  end
end
