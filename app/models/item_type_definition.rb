class ItemTypeDefinition < ActiveRecord::Base
  attr_accessible :name, :kind, :item_field_definition_ids, :is_containerable, :kind_id, :item_ids

  has_many :items
  has_many :item_field_definitions
  belongs_to :kind
  
  validates_presence_of :name, :kind

  def self.options
    opts = ItemTypeDefinition.all.map {|itd| [itd.name, itd.id]}
    opts.unshift ["-- Please Select a Kind --", ""]
  end
end
