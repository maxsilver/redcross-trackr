Given /^I am logged in as a member$/ do
	pending
  @member = FactoryGirl.create(:user)
  visit new_user_session_path
  fill_in "Username", :with => @member.username
  fill_in "Password", :with => @member.password
  click_on "Sign In"
end

When /^I create a location$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^that location should get added to the list$/ do
  pending # express the regexp above with the code you wish you had
end
