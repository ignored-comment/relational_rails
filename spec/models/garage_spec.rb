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

  describe 'instance methods', type: :model do
    it 'returns the motorcycles that have the required amount available' do
      garage = Garage.create!(name: 'model garage')
      motorcycle1 = garage.motorcycles.create!(name: 'banana type-s', ride_ready: true, model_year:2018) 
      motorcycle2 = garage.motorcycles.create!(name: 'banana type-r', ride_ready: false, model_year:2019) 
      motorcycle3 = garage.motorcycles.create!(name: 'banana type-banana', ride_ready: true, model_year:2020) 
      
      expect(garage.new_motorcycles(2018)).to eq([motorcycle2, motorcycle3])
    end
    
    it 'alphabetizes motorcycles by name' do
      garage = Garage.create!(name: 'model garage')
      motorcycle2 = garage.motorcycles.create!(name: 'B-banana type-r', ride_ready: false, model_year:2019) 
      motorcycle3 = garage.motorcycles.create!(name: 'C-banana type-banana', ride_ready: true, model_year:2020) 
      motorcycle1 = garage.motorcycles.create!(name: 'A-banana type-s', ride_ready: true, model_year:2018) 

      expect(garage.alphabetize).to eq([motorcycle1, motorcycle2, motorcycle3])
    end
  end
end