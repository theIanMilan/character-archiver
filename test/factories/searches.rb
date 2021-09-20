FactoryBot.define do
  factory :search do
    association :character
    searching_for_connections? { true }
    search_message { Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) }
  end
end
