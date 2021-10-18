class Meal < ApplicationRecord
  has_many :foods, dependent: :destroy

  validates_presence_of :title, :created_by
end
