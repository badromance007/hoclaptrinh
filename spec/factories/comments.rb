FactoryGirl.define do
  factory :comment do
    association :user
    association :link
    body { Faker::Lorem.sentence }
  end

end
