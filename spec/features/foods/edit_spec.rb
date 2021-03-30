require 'rails_helper'

RSpec.describe 'Update Food' do
  describe 'As a visitor' do
    describe 'When I visit the foods index' do
      it 'I can update a food' do
        refrigerator = Refrigerator.create(name: 'Beatles Refrigerator')
        food = refrigerator.foods.create!(name: 'Mayo', expired: false, total_items_available: 3)

        visit "/foods/#{food.id}"

        click_link_or_button 'Update Food'

        expect(current_path).to eq("/foods/#{food.id}/edit")

        fill_in 'Name', with: 'Fancy Mayo'
        check "expired"
        fill_in 'total_items_available', with: 99
        click_on 'Update Food'

        expect(current_path).to eq("/foods/#{food.id}")
        expect(page).to have_content('Fancy Mayo')
      end
    end
  end
end