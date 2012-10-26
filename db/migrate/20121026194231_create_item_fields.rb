class CreateItemFields < ActiveRecord::Migration
  def change
    create_table :item_fields do |t|
      t.string :label
      t.string :type
      t.timestamps
    end
  end
end
