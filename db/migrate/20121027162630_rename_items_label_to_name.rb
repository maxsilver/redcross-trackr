class RenameItemsLabelToName < ActiveRecord::Migration
  def change
    rename_column :items, :label, :name
  end
end