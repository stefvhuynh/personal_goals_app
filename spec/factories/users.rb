FactoryGirl.define do
  factory :user do
    username Faker::Name.name
    password "123abc"
  end
end