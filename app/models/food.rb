class Food < ApplicationRecord
  belongs_to :refrigerator

  def self.expired
    self.where(expired: true)
  end
end