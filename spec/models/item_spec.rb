require 'spec_helper'

describe Item do
  before(:each) do
  	@item = FactoryGirl.build(:item)
  	@item.should be_valid
  end

  subject { @item }

  it "requires a name" do
  	@item.name = ""
  	@item.should_not be_valid
  end
end
