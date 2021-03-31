class Garage < ApplicationRecord
  has_many :motorcycles, dependent: :destroy

  def count_motorcycles
    self.motorcycles.count
  end
end
