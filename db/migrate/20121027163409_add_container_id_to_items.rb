class AddContainerIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :container_id, :integer
  end
end
