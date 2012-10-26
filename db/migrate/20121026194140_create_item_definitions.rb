class CreateItemDefinitions < ActiveRecord::Migration
  def change
    create_table :item_definitions do |t|

      t.timestamps
    end
  end
end
