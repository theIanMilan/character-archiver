FactoryBot.define do
  factory :class_and_level do
    association :character
    character_class { %w[fighter wizard cleric].sample }
    character_subclass { %w[champion abjuration death].sample }
    character_level { rand(3..13) }
  end
end
