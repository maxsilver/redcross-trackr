class RenameFieldLabelToName < ActiveRecord::Migration
  def change
    rename_column :item_field_definitions, :label, :name
  end
end