FactoryBot.define do
  factory :character do
    association :user
    character_name { Faker::Games::ElderScrolls.name }
    character_portrait_URL { Faker::LoremFlickr.image(size: '50x60') }
    portrait_credit_artist { Faker::Twitter.screen_name }
    portrait_credit_URL { "http://www.twitter.com/#{portrait_credit_artist}" }
    background { Faker::Games::DnD.background }
    alignment { rand(0..8) }
    race { Faker::Games::DnD.race }
    sex { ['male', 'female', 'intersex', 'prefer not to say'].sample }
    gender { Faker::Gender.type }
    sexual_orientation { ['asexual', 'bisexual', 'gay or lesbian', 'straight', 'pansexual', 'queer', 'prefer not to say'].sample }
    # https://www.surveymonkey.com/curiosity/ask-survey-questions-sexual-orientation-gender-identity/
    private_character { false }

    factory :character_with_multiple_classes do
      # create(:character_with_multiple_classes, classes_count: 2).class_and_levels.count # 2
      transient do
        # classes_count is declared as a transient attribute
        # available in the callback via the evaluator
        classes_count { 3 }
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |character, evaluator|
        create_list(:class_and_level, evaluator.classes_count, character: character)
        character.reload
      end
    end

    factory :character_full_associations do
      transient do
        classes_count { 1 }
      end

      after(:create) do |character, evaluator|
        create_list(:class_and_level, evaluator.classes_count, character: character)
        character.reload
        create(:backstory, character: character)
        create(:physical_attribute, character: character)
        create(:search, character: character)
      end
    end
  end
end
