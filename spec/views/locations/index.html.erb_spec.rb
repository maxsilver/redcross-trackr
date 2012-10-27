require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :name => "Name",
        :address => "Address",
        :address2 => "Address2",
        :city => "City",
        :state_id => 1,
        :zip => "Zip",
        :contact_name => "Contact Name",
        :contact_phone => "Contact Phone",
        :national_shelter_system_identifier => "National Shelter System Identifier",
        :chapter_id => 2
      ),
      stub_model(Location,
        :name => "Name",
        :address => "Address",
        :address2 => "Address2",
        :city => "City",
        :state_id => 1,
        :zip => "Zip",
        :contact_name => "Contact Name",
        :contact_phone => "Contact Phone",
        :national_shelter_system_identifier => "National Shelter System Identifier",
        :chapter_id => 2
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Phone".to_s, :count => 2
    assert_select "tr>td", :text => "National Shelter System Identifier".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
