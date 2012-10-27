class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :name, :null => false, :unique => true

      t.timestamps
    end
  end
end
