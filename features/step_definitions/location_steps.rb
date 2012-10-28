Given /^I am logged in as a member$/ do
  @member = FactoryGirl.create(:user)
  visit new_user_session_path
  fill_in "Email", :with => @member.email
  fill_in "Password", :with => @member.password
  click_on "Sign in"
end

When /^I create a location$/ do
  @location_name = "Red Cross Office"
  FactoryGirl.create(:state, :name => "Michigan")
  FactoryGirl.create(:chapter, :name => "Greater Grand Rapids")
  visit new_location_path
  fill_in "Name", :with => @location_name
  fill_in "Address", :with => "584 Penny Lane"
  fill_in "City", :with => "Grand Rapids"
  select "Michigan", :from => "State"
  fill_in "Zip", :with => "49505"
  select "Greater Grand Rapids", :from => "Chapter"
  click_on "Create"
end

Then /^that location should get added to the list$/ do
  visit locations_path
  page.should have_content(@location_name)
end

When /^I delete a location$/ do
  @location_name = "Delete Me"
  @location = FactoryGirl.create(
    :location,
    :name => @location_name
  )
  visit edit_location_path(@location)
  click_on "Delete"
end

Then /^that location should get set to inactive, but not actually deleted$/ do
  page.should_not have_content(@location_name)
  location = Location.unscoped.find(@location.id)
  location.should_not be_nil
  location.deleted_at.should_not be_nil
end


Given /^I have a location that has items attached to it$/ do
  @location = FactoryGirl.create(
    :location_with_items,
    :name => "Try to Delete Me"
  )
end

When /^I try to delete that location$/ do
  visit edit_location_path(@location)
  click_on "Delete"
end

Then /^I should get an error$/ do
  page.should have_content("Can't delete this location because it has items attached to it.")
end

Then /^that location should not be deleted$/ do
  location = Location.unscoped.find(@location.id)
  location.should_not be_nil
  location.deleted_at.should be_nil
end

Given /^there exists a location "(.*?)":$/ do |location_name|
  FactoryGirl.create(:location, :name => location_name)
end

When /^I am on the "(.*?)" location page$/ do |location_name|
  location = Location.find_by_name location_name
  visit location_path(location)

  save_and_open_page
end

Then /^I should be on the "(.*?)" location page$/ do |location_name|
  page.should_not have_content("Name can't be blank")
  page.should have_content(location_name)
end

Then /^I should see the following item:$/ do |table|
  pending
end

Given /^a location "(.*?)" exists$/ do |name|
  FactoryGirl.create(:location, name: name)
end

When /^I follow "(.*?)"$/ do |text|
  click_on text
end

When /^I select "(.*?)" from "(.*?)"$/ do |option, select_field_label|
  page.should have_content("Give Item")
  select option, :from => select_field_label
end

When /^I press "(.*?)"$/ do |label|
  click_on label
end

Then /^"(.*?)" should have (\d+) "(.*?)"$/ do |location_name, quantity, item_name|
  location = Location.find_by_name(location_name)
  item = Item.find_by_name(item_name)
  location.number_of_items_of_type(item.item_type_definition).should == quantity.to_i
end
