class ChangeFieldDefinitionToUseKind < ActiveRecord::Migration
  def change
    remove_column :item_type_definitions, :quantifiable
    remove_column :item_type_definitions, :container
    add_column :item_type_definitions, :kind, :string
  end
end
