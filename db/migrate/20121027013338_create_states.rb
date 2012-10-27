class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, :null => false, :unique => true
      t.string :abbreviation, :null => false, :unique => true

      t.timestamps
    end
  end
end
