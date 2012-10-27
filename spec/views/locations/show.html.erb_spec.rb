require 'spec_helper'

describe "locations/show" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/Address2/)
    rendered.should match(/City/)
    rendered.should match(/1/)
    rendered.should match(/Zip/)
    rendered.should match(/Contact Name/)
    rendered.should match(/Contact Phone/)
    rendered.should match(/National Shelter System Identifier/)
    rendered.should match(/2/)
  end
end
