FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jon#{n}@doe.com" }
    password "password123"
    sequence(:username) { |n| "jon#{n}@doe" }
  end
end
