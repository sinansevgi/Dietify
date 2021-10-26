FactoryBot.define do
  factory :meal do
    title { Faker::Lorem.word }
    user_id {}
  end
end
