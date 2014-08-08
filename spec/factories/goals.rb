FactoryGirl.define do
  factory :goal do
    title 'Eat 100 hotdogs in under 10 minutes'
    plan 'Practice eating hotdogs everyday for 3 hours'
    shared 'true'
    completed 'false'
    user_id 1
  end
end
