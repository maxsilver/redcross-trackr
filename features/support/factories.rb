FactoryGirl.define do
  factory :user do
  	sequence(:email) { |n| "user#{n}@example.com" }
  	password "password"
  end

  factory :item_type_definition do
  	sequence(:name) { |n| "Definition #{n}" }
    kind
  end

  factory :kind do
  	sequence(:name) { |n| "Kind #{n}" }
  end

  factory :item do
    name "Cot"
    item_type_definition
  end

  factory :location do
  	sequence(:name) { |n| "Location #{n}" }
  	address "123 Fake Street"
  	city "Grand Rapids"
  	state
  	zip "49505"
  	chapter

    factory :location_with_items do
      items FactoryGirl.create_list(:item, 5)
    end
  end

  factory :state do
  	name "Michigan"
  	abbreviation "MI"
  end

  factory :chapter do
  	name "Chapter"
    code "foo"
    region
  end

  factory :region do
    name "Midwest"
    code "foo"
  end
end
