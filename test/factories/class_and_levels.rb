FactoryBot.define do
  factory :class_and_level do
    association :character
    sequence :character_class,
             %w[Fighter Wizard Cleric Rogue Paladin Monk Ranger Druid Sorcerer Barbarian Bard]
               .cycle
    sequence :character_subclass,
             %w[Champion Abjuration Order Thief Devotion Kensei Beastmaster Land Wild Totem Lore]
               .cycle
    character_level { rand(3..5) }
  end
end
