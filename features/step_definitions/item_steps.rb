When /^I add the following item to the location:$/ do |table|
  click_link "Add New Item"

  data = table.rows_hash

  type = data.delete "Kind"
  container = data.delete "Container"


  save_and_open_page
  select type, :from => "Kind:"
  select container, :from => "Container" if container

  data.each_pair do |k, v|
    fill_in k, :with => v
  end
end
