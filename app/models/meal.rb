class Meal < ApplicationRecord
  has_many :foods, dependent: :destroy
  belongs_to :user

  validates_presence_of :title

  scope :latest_meals, lambda { |user_id|
                         where(user_id: user_id)
                           .where('created_at >= ? ', (Date.today - 30.days).beginning_of_day)
  }
  def daily
    created_at.strftime('%Y/%m/%d')
  end

  def total_calories
    foods.sum(:calories)
  end

end
