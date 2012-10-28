class AddDescriptionToLocationsAndItems < ActiveRecord::Migration
  def change
    add_column :locations, :description, :string
    add_column :items, :description, :string
  end
end