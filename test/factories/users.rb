FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { "#{Faker::Number.number(digits: 5)}#{Faker::Name.first_name}" }
  end
end
