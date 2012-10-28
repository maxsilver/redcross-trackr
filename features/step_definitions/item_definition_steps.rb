Given /^there exists an item definition "(.*?)":$/ do |name, table|
  initial_data = table.rows_hash

  opts = {
    "name" => initial_data["Name"],
    "kind" => Kind.find_or_create_by_name(initial_data["Kind"]),
    "is_containerable" => initial_data["Is Containerable"] || false
  }
  puts opts

  FactoryGirl.create(:item_type_definition, opts)
end
