class AddRegionIdToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :region_id, :integer
  end
end
