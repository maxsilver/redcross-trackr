class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :label
      t.integer :item_type_definition_id
      t.integer :quantity
      t.timestamps
    end
  end
end
