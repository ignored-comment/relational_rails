class Motorcycle < ApplicationRecord
  belongs_to :garage

  def self.ride_ready_motorcycles
    self.where(ride_ready: true)
  end
end
