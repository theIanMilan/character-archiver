FactoryBot.define do
  factory :organization do
    association :user
    name { Faker::Games::Fallout.faction }
    symbol_URL { Faker::Company.logo }
    type { Faker::Company.suffix }
    base_of_operations { Faker::Games::DnD.city }
    goals { Faker::Company.catch_phrase }
    intro { Faker::Games::Fallout.quote }
    quote { Faker::Games::WorldOfWarcraft.quote }
    organization_history { Faker::Books::Lovecraft.paragraph_by_chars(characters: 256) }
  end
end
