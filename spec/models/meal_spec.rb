require 'rails_helper'

RSpec.describe Meal, type: :model do
  # Association test
  # ensure Meal model has a one-to-many relationship with the Food model
  it { should have_many(:foods).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
end
