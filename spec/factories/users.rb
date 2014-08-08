require 'faker'

# FactoryGirl.define do
#   factory :user do
#     username {Faker::Name.name} #check
#     password "123abc"
#   end
# end

FactoryGirl.define do

  factory :user, class: User do
    username {Faker::Name.name}
    password "123456"

    factory :user_with_goals do
      ignore do
        goals_count 1
      end

      after(:create) do |user_two, evaluator|
        create_list(:goal, evaluator.goals_count, user: user_two)
      end

    end

  end

end



