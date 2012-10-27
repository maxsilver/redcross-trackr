FactoryGirl.define do
  factory :user do
  	sequence(:email) { |n| "user#{n}@example.com" }
  	password "password"
  end

  factory :location do
  	sequence(:name) { |n| "#{n}" }
  end
end