FactoryBot.define do
  factory :profile do
    association :user
    display_name { Faker::Internet.username(specifier: 8..10) }
    avatar_URL { Faker::LoremFlickr.image(size: '50x60') }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    about_me { Faker::Quote.matz }
    location { Faker::Address.country }
    twitter_username { Faker::Internet.username(specifier: 8..10, separators: '_') }
    instagram_username { Faker::Internet.username(specifier: 8..10, separators: ['.', '_']) }
    discord_username { "#{Faker::Internet.username(specifier: 8..10, separators: '.')}##{Faker::Number.number(digits: 10)}" }
  end
end
