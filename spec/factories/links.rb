FactoryGirl.define do
  factory :link do
    association :user
    title { Faker::Name.title }
    url { Faker::Internet.url }
    description { Faker::Lorem.paragraph }
    image_url { Faker::Avatar.image }
    site_name { Faker::App.name }

    factory :invalid_link do
      url nil
    end
  end

end
