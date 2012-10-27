require File.join(File.dirname(__FILE__), *%w[.. spec_helper])

describe Item do
  let(:item_type) do
    ItemTypeDefinition.create({
         :name => "Pillow",
    })
  end

  let(:item) { Item.create({:item_type_definition => item_type}) }

  it "can be initialized" do
    item.should_not be_nil
  end

  it "should have a location" do
    location = FactoryGirl.build(:location, :name => "The Pantry")
    item.current_location = location
    item.save!
    item.reload
    item.current_location.should eq(location)
  end

  context "when the item is containerable" do
    before do
      item_type.is_containerable = true
      item_type.save!
      item_type.is_containerable.should eq(true)
    end

    it "should allow items to be contained" do
      children_list = [Item.create(), Item.create()]

      item.contained_items = children_list
      item.save!
      item.reload
      item.items.should eq(children_list)
    end
  end

  context "when the item is not containerable" do
    before do
      item_type.is_containerable = false
      item_type.save!
      item_type.is_containerable.should eq(false)
    end

    it "shoud not allow items to be contained" do
      children_list = [Item.create(), Item.create()]
    end
  end
end