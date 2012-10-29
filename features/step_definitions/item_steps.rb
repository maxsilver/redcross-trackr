When /^I add the following item to the location:$/ do |table|
  click_link "Add Item"

  data = table.rows_hash

  save_and_open_page
  select data["Kind"], :from => "Kind:"
  select data["Container"], :from => "Container" if data["Container"] 

  data.delete("Kind")
  data.delete("Container")

  data.each_pair do |k, v|
    fill_in k, :with => v
  end

  click_on "Create"
end

Given /^"(.*?)" has (\d+) "(.*?)" \(which are "(.*?)"\)$/ do |location_name, quantity, item_name, type_name|
  location = Location.find_by_name(location_name)
  FactoryGirl.create(
    :item,
    :name => item_name,
    :home_location => location,
    :current_location => location,
    :item_type_definition => ItemTypeDefinition.find_or_create_by_name(type_name),
    :quantity => quantity
  )
end
