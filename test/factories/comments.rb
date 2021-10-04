FactoryBot.define do
  factory :comment do
    association :user
    association :profile
    body { Faker::JapaneseMedia::OnePiece.quote }
  end
end
