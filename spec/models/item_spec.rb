require File.join(File.dirname(__FILE__), *%w[.. spec_helper])

describe Item do
  it "can be initialized" do
    item = Item.create

    item.should_not be_nil
  end

  it "should have a location" do
    item = Item.create
    location = Location.create(:name => "The Pantry")
    item.current_location = location
    item.save!
    item.reload
    item.current_location.should eq(location)
  end
end