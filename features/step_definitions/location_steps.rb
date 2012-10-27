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
  click_on "Create Location"
end

Then /^that location should get added to the list$/ do
  visit locations_path
  page.should have_content(@location_name)
end
