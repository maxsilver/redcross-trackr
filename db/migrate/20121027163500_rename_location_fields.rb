class RenameLocationFields < ActiveRecord::Migration
  def change
    rename_column :items, :owner_id, :home_location_id
    rename_column :items, :location_id, :current_location_id
  end
end