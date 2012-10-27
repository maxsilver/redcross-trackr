class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :address2
      t.string :city
      t.integer :state_id
      t.string :zip
      t.string :contact_name
      t.string :contact_phone
      t.string :national_shelter_system_identifier
      t.integer :chapter_id

      t.timestamps
    end
  end
end
