require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :name => "MyString",
      :address => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state_id => 1,
      :zip => "MyString",
      :contact_name => "MyString",
      :contact_phone => "MyString",
      :national_shelter_system_identifier => "MyString",
      :chapter_id => 1
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path, :method => "post" do
      assert_select "input#location_name", :name => "location[name]"
      assert_select "input#location_address", :name => "location[address]"
      assert_select "input#location_address2", :name => "location[address2]"
      assert_select "input#location_city", :name => "location[city]"
      assert_select "input#location_state_id", :name => "location[state_id]"
      assert_select "input#location_zip", :name => "location[zip]"
      assert_select "input#location_contact_name", :name => "location[contact_name]"
      assert_select "input#location_contact_phone", :name => "location[contact_phone]"
      assert_select "input#location_national_shelter_system_identifier", :name => "location[national_shelter_system_identifier]"
      assert_select "input#location_chapter_id", :name => "location[chapter_id]"
    end
  end
end
