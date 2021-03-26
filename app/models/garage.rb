class Garage < ApplicationRecord
  has_many :motorcycles

  def count_motorcycles
    self.motorcycles.count
  end
end
