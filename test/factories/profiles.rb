FactoryBot.define do
  factory :profile do
    association :user
    display_name { Faker::Internet.username(specifier: 8..10) }
    avatar_URL { Faker::LoremFlickr.image(size: '50x60') }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    about_me { Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) }
    location { Faker::Address.country }
    twitter_username { Faker::Internet.username(specifier: 8..10) }
    instagram_username { Faker::Internet.username(specifier: 8..10) }
    discord_username { "#{Faker::Internet.username(specifier: 8..10)}##{Faker::Number.number(digits: 10)}" }
  end
end
