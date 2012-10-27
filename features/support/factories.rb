FactoryGirl.define do
  factory :user do
  	sequence(:email) { |n| "user#{n}@example.com" }
  	password "password"
  end

  factory :location do
  	name "Red Cross HQ"
  	address "123 Fake Street"
  	city "Grand Rapids"
  	state
  	zip "49505"
  	chapter
  end

  factory :state do
  	name "Michigan"
  	abbreviation "MI"
  end

  factory :chapter do
  	name "Chapter"
  end
end