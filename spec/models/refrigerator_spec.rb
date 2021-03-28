require 'rails_helper'

RSpec.describe Refrigerator, type: :model do
  describe 'relationships' do
    it {should have_many :foods}
  end

  describe 'class methods' do
    describe '.count_foods' do
      it 'returns the number of foods in a refrigerator' do
        refrigerator = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)

        food1 = refrigerator.foods.create!(name: "apple", expired: true, total_items_available:12)
        food2 = refrigerator.foods.create!(name: "snapple", expired: false, total_items_available:1)

        expect(refrigerator.count_foods).to eq(2)
      end
    end
  end
end