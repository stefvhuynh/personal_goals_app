# Read about factories at https://github.com/thoughtbot/factory_girl

# FactoryGirl.define do
#   factory :user do
#     string ""
#     string ""
#     string ""
#   end
# end

require 'faker'

FactoryGirl.define do
  factory :user do
    username Faker::Name.name #check
    password "123abc"
  end
end