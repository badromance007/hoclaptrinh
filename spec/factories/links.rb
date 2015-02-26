FactoryGirl.define do
  factory :link do
    user_id 0
    title { Faker::Name.title }
    url { Faker::Internet.url }
    description { Faker::Lorem.paragraph }
    image_url { Faker::Avatar.image }
    site_name { Faker::App.name }
  end

end
