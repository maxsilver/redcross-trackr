class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :label
      t.integer :item_type_definition_id
      t.integer :location_id
      t.integer :owner_id
      t.integer :quantity
      t.timestamps
    end
  end
end
