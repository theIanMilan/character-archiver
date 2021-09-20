FactoryBot.define do
  factory :character do
    association :user
    character_name { Faker::Games::ElderScrolls.name }
    chracter_portrait_URL { Faker::LoremFlickr.image(size: '50x60') }
    portrait_credit_artist { Faker::Twitter.screen_name }
    portrait_credit_link { "http://www.twitter.com/#{portrait_credit_artist}" }
    background { Faker::Games::DnD.background }
    alignment { rand(0..8) }
    race { Faker::Games::DnD.race }
    sex { ['male', 'female', 'intersex', 'prefer not to say'].sample }
    gender { Faker::Gender.type }
    sexual_orientation { ['asexual', 'bisexual', 'gay or lesbian', 'straight', 'pansexual', 'queer', 'prefer not to say'].sample }
    # https://www.surveymonkey.com/curiosity/ask-survey-questions-sexual-orientation-gender-identity/
    private? { false }
  end
end

def character_with_multiple_classes(classes_count: 3)
  FactoryBot.create(:character) do |char|
    FactoryBot.create_list(:class_and_level, classes_count, character: char)
  end
end
