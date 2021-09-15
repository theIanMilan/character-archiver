FactoryBot.define do
  factory :user, class: 'User' do
    username { "#{Faker::Number.number(digits: 3)}#{Faker::Name.first_name}" }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role { 1 }
  end
end
