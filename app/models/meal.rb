class Meal < ApplicationRecord
  has_many :foods, dependent: :destroy
  belongs_to :user

  validates_presence_of :title
end
