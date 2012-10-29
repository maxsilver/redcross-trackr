class ItemFieldValue < ActiveRecord::Base
  attr_accessible :item_field_definition_id, :item_id, :value
  belongs_to :item_field_definition
  validate :if_required

    def if_required
      if item_field_definition.required?
        if value.blank?
          errors.add :value, :present, :label => label
        end
      end
    end


  def label
    item_field_definition.name
  end

end
