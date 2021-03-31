require 'rails_helper'

RSpec.describe 'Displays sorted foods by name' do
  describe 'when i visit index of the food of the refrigerator' do
    describe 'and i click on the link to sort foods in alphabetical order' do
      it 'lists the foods in alphabetical order' do

        refrigerator = Refrigerator.create(name: 'Beatles Refrigerator')
        food = refrigerator.foods.create!(name: 'Mayo', expired: true, total_items_available: 19)

        visit "/refrigerators/#{refrigerator.id}/foods"

        click_link_or_button 'Sort Foods By Alphabetical Order'

        expect(current_path).to eq("/refrigerators/#{refrigerator.id}/foods")
        expect(page).to have_content('Mayo')
      end
    end
  end
end
