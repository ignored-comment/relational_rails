require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'relationships' do
    it {should belong_to :refrigerator}
  end
  describe 'class methods', type: :model do
    it 'returns expired foods' do
      refrigerator = Refrigerator.create!(name: 'model refrigerator')
      food1 = refrigerator.foods.create!(name: 'banana', expired: true, total_items_available:3) 
      food2 = refrigerator.foods.create!(name: 'banana', expired: false, total_items_available:2) 
      food3 = refrigerator.foods.create!(name: 'banana', expired: true, total_items_available:30) 

      expect(refrigerator.foods.expired_foods).to eq([food1, food3]) 
    end
  end
end