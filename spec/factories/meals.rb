FactoryBot.define do
  factory :meal do
    title { Faker::Lorem.word }
    created_by { Faker::Number.number(digits: 2) }
  end
end
