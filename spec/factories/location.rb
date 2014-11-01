FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "this#{n}park" }
    address "123 Fake street"
    city "New York"
    state "NY"
    user
  end
end
