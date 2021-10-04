FactoryBot.define do
  factory :comment do
    association :user
    association :profile
    body { Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) }
  end
end
