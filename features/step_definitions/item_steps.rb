When /^I add the following item to the location:$/ do |table|
  save_and_open_page

  click_link "Add New Item"

  data = table.rows_hash

  type = data.delete "Type"
  container = data.delete "Container"

  select type, :from => "Type"
  select container, :from => "Container" if container

  data.each_pair do |k, v|
    fill_in k, :with => v
  end
end