FactoryGirl.define do
  factory :user do
  	sequence(:email) { |n| "user#{n}@example.com" }
  	password "password"
  end

  factory :item_type_definition do
  end

  factory :item do
    item_type_definition

    factory :cots do
    end
  end

  factory :location do
  	name "Red Cross HQ"
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
