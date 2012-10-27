class CreateItemTypeDefinitions < ActiveRecord::Migration
  def change
    create_table :item_type_definitions do |t|
      t.string :name
      t.boolean :is_containerable, :default => false
      t.integer :kind_id
      t.timestamps
    end
  end
end
