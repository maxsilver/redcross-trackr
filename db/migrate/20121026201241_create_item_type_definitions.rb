class CreateItemTypeDefinitions < ActiveRecord::Migration
  def change
    create_table :item_type_definitions do |t|
      t.string :name
      t.timestamps
    end
  end
end
