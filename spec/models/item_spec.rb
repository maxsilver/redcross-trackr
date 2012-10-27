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

  it "can be saved without messing up home_location" do
    @jasons_house = FactoryGirl.create(:location)
    @cots = FactoryGirl.create(:item, :home_location => @jasons_house)
    @cots.home_location.should == @jasons_house
    @cots.save!
    @cots.home_location.should == @jasons_house
  end

  context "moving" do
    before do
      @jasons_house = FactoryGirl.create(:location)
      @marks_house = FactoryGirl.create(:location)
      TOTAL_COT_QUANTITY ||= 100
      @cots = FactoryGirl.create(
        :item,
        :home_location => @jasons_house,
        :current_location => @jasons_house,
        :quantity => TOTAL_COT_QUANTITY
      )
    end

    describe "moving all at once" do
      it "works" do
        @cots.move(
          :new_location => @marks_house,
          :quantity => TOTAL_COT_QUANTITY
        )
        @jasons_house.number_of_items_of_type(@cots.item_type_definition).should == 0
        @marks_house.number_of_items_of_type(@cots.item_type_definition).should == TOTAL_COT_QUANTITY
      end
    end

    describe "moving just some" do
      it "works" do
        JUST_SOME ||= 5
        @cots.move(
          :new_location => @marks_house,
          :quantity => JUST_SOME
        )
        @jasons_house.number_of_items_of_type(@cots.item_type_definition).should == TOTAL_COT_QUANTITY - JUST_SOME
        @marks_house.number_of_items_of_type(@cots.item_type_definition).should == JUST_SOME
      end
    end
  end
end
