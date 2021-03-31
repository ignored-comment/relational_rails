class Refrigerator < ApplicationRecord
  has_many :foods, dependent: :destroy

  def count_foods
    self.foods.count
  end
end