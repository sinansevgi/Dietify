# rubocop:disable Lint/EmptyBlock

FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    calories { Faker::Number.number(digits: 3) }
    meal_id {}
  end
end
# rubocop:enable Lint/EmptyBlock
