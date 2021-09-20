FactoryBot.define do
  factory :backstory do
    association :character
    body { Faker::Lorem.paragraphs(number: 3, supplemental: true) }
    personality { Faker::Lorem.paragraphs(number: 1, supplemental: true) }
    ideals { Faker::Lorem.paragraphs(number: 1, supplemental: true) }
    bonds { Faker::Lorem.paragraphs(number: 1, supplemental: true) }
    flaws { Faker::Lorem.paragraphs(number: 1, supplemental: true) }
  end
end
