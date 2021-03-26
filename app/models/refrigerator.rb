class Refrigerator < ApplicationRecord
  has_many :foods

  def count_foods
    self.foods.count
  end
end