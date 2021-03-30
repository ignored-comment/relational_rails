class Food < ApplicationRecord
  belongs_to :refrigerator

  def self.expired_foods
    self.where(expired: true)
  end
end