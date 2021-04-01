class Garage < ApplicationRecord
  has_many :motorcycles, dependent: :destroy

  def count_motorcycles
    self.motorcycles.count
  end

  def new_motorcycles(year)
    self.motorcycles.where("model_year > ?", year)
  end

  def alphabetize
    self.motorcycles.order(:name)
  end
end