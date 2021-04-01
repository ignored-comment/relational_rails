require 'rails_helper'

RSpec.describe Motorcycle, type: :model do
  describe 'relationships' do
    it {should belong_to :garage}
  end

  describe 'class methods', type: :model do
    it 'returns expired motorcycles' do
      garage = Garage.create!(name: 'model garage')
      motorcycle1 = garage.motorcycles.create!(name: 'banana type-s', ride_ready: true, model_year:3) 
      motorcycle2 = garage.motorcycles.create!(name: 'banana type-r', ride_ready: false, model_year:2) 
      motorcycle3 = garage.motorcycles.create!(name: 'banana type-banana', ride_ready: true, model_year:30) 

      expect(garage.motorcycles.ride_ready_motorcycles).to eq([motorcycle1, motorcycle3]) 
    end
  end

  describe 'instance methods', type: :model do
    it 'returns the motorcycles that have the required amount available' do
      garage = Garage.create!(name: 'model garage')
      motorcycle1 = garage.motorcycles.create!(name: 'banana type-s', ride_ready: true, model_year:2018) 
      motorcycle2 = garage.motorcycles.create!(name: 'banana type-r', ride_ready: false, model_year:2019) 
      motorcycle3 = garage.motorcycles.create!(name: 'banana type-banana', ride_ready: true, model_year:2020) 

      expect(garage.motorcycles.).to eq(motorcycle2, motorcycle3)
    end
  end
end