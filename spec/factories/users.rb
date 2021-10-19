FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { "mail@example.com" }
    password { "password" }
  end
end
