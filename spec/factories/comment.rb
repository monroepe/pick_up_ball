FactoryGirl.define do
  factory :comment do
    body "Gonna be a game"
    game
    user
  end
end
