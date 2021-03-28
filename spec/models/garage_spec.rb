require 'rails_helper'

RSpec.describe Garage, type: :model do
  describe 'relationships' do
    it {should have_many :motorcycles}
  end

  describe 'class methods' do
    describe '.count_motorcycles' do
      it 'returns the number of motorcycles in a garage' do
        garage_1 = Garage.create!(name: "Kon's Garage", at_capacity: false, max_capacity: 4)

        motorcycle_1 = garage_1.motorcycles.create!(name: "ZoomZoom X1", ride_ready: true, model_year: 2050)
        motorcycle_2 = garage_1.motorcycles.create!(name: "VroomVroom X-Wowza-so-fast", ride_ready: true, model_year: 1969)

        expect(garage_1.count_motorcycles).to eq(2)
      end
    end
  end
end