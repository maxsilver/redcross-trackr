require 'spec_helper'

describe Location do
  before(:each) do
  	@location = FactoryGirl.build(:location)
  	@location.should be_valid
  end

  subject { @location }

  it "requires a name" do
  	@location.name = ""
  	@location.should_not be_valid
  end

  it "requires an address" do
  	@location.address = ""
  	@location.should_not be_valid
  end

  it "requires a city" do
    @location.city = ""
  	@location.should_not be_valid
  end

  it "requires a state" do
  	@location.state_id = nil
  	@location.should_not be_valid
  end

  it "requires a zip code" do
  	@location.zip = ""
  	@location.should_not be_valid
  end

  it "requires a chapter" do
  	@location.chapter = nil
  	@location.should_not be_valid
  end

  it "requires a unique national shelter system identifier" do
  	non_unique_identifier = "1234"
  	other_location = FactoryGirl.create(
  		:location,
  		:national_shelter_system_identifier => non_unique_identifier
  	)
  	@location.national_shelter_system_identifier = non_unique_identifier
  	@location.should_not be_valid
  end
  
  it "allows multiple locations with blank national shelter system identifier" do
  	other_location = FactoryGirl.create(:location)
  	other_location = FactoryGirl.build(:location)
  	other_location.should be_valid
  end
end
