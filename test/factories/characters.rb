FactoryBot.define do
  factory :character do
    association :user
    character_name { Faker::Name.male_first_name }
    chracter_portrait_URL { Faker::LoremFlickr.image(size: '50x60') }
    portrait_credit_artist { Faker::Internet.username(specifier: 8..10) }
    portrait_credit_link { "http://www.twitter.com/#{portrait_credit_artist}" }
    background { 'acolyte' }
    alignment { rand(0..8) }
    race { %w[human dwarf gnome half-orc half-elf halfling].sample }
    sex { ['male', 'female', 'intersex', 'prefer not to say'].sample }
    gender { ['male', 'female', 'non-binary', 'transgender', 'prefer not to say'].sample }
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
