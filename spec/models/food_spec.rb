require 'rails_helper'

RSpec.describe Food, type: :model do
  # Association test
  # ensure an food record belongs to a single meal record
  it { should belong_to(:meal) }
  # Validation test
  # ensure column name and calories is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:calories) }
end
