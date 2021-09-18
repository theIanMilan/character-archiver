FactoryBot.define do
  factory :character do
    character_name { Faker::Name.male_first_name }
    chracter_portrait_URL { Faker::LoremFlickr.image(size: '50x60') }
    portrait_credit_artist { Faker::Internet.username(specifier: 8..10) }
    portrait_credit_link { Faker::Internet.domain_name(domain: 'twitter.com') }
    background { 'acolyte' }
    alignment { 0 }
    race { 'human' }
    sex { 'male' }
    gender { 'male' }
    sexual_orientation { 'straight' }
    private { false }
  end
end
