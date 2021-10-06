FactoryBot.define do
  factory :backstory do
    association :character
    intro { Faker::Quote.matz }
    quote_body { Faker::Quote.famous_last_words }
    quote_author { Faker::TvShows::Simpsons.character }
    appearance { Faker::TvShows::Community.quotes }
    personality { Faker::Lorem.paragraphs(number: 1, supplemental: true) }
    ideals { Faker::Lorem.paragraphs(number: 1, supplemental: true) }
    bonds { Faker::Lorem.paragraphs(number: 1, supplemental: true) }
    flaws { Faker::Lorem.paragraphs(number: 1, supplemental: true) }
    biography { Faker::Lorem.paragraphs(number: 3, supplemental: true) }
  end
end
