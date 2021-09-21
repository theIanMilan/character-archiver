FactoryBot.define do
  factory :physical_attribute do
    association :character
    age { rand(18..100) }
    height { Faker::Measurement.metric_height }
    weight { Faker::Measurement.metric_weight }
    eyes { Faker::Color.color_name }
    skin { Faker::Color.color_name }
    hair { Faker::Color.color_name }
  end
end
