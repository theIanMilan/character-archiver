FactoryBot.define do
  factory :class_and_level do
    association :character
    sequence :character_class,
             %w[fighter wizard cleric rogue paladin monk ranger
                druid sorcerer barbarian bard].cycle
    sequence :character_subclass,
             %w[champion abjuration order thief devotion kensei beastmaster
                land wild totem lore].cycle
    character_level { rand(3..5) }
  end
end
