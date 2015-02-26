FactoryGirl.define do
  factory :comment do
    user_id 0
    link_id 0
    body { Faker::Lorem.sentence }
  end

end
