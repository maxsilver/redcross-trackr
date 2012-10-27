class ItemTypeDefinition < ActiveRecord::Base
  attr_accessible :name, :kind, :item_field_definition_ids

  has_many :items
  has_many :item_field_definitions
  belongs_to :kind

  def self.options
    ItemTypeDefinition.all.map {|itd| [itd.name, itd.id]}
  end
end
