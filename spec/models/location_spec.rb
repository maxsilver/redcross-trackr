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
end
