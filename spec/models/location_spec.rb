require 'spec_helper'

describe Location do
  before(:each) do
  	@location = FactoryGirl.build(:location)
  end

  subject { @location }

  it "requires a name" do
  	@location.name = ""
  	@location.should_not be_valid
  end
end
