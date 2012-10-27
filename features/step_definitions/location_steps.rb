Given /^I am logged in as a member$/ do
  @member = FactoryGirl.create(:user)
  visit new_user_session_path
  fill_in "Email", :with => @member.email
  fill_in "Password", :with => @member.password
  click_on "Sign in"
end

When /^I create a location$/ do
  visit new_location_path
  @location_name = "Red Cross Office"
  fill_in "Name", :with => @location_name
  click_on "Create Location"
end

Then /^that location should get added to the list$/ do
  visit locations_path
  page.should have_content(@location_name)
end
