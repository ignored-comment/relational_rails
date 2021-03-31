require 'rails_helper'

RSpec.describe 'Displays sorted motorcycles by name' do
  describe 'when i visit index of the motorcycle of the garage' do
    describe 'and i click on the link to sort motorcycles in alphabetical order' do
      it 'lists the motorcycles in alphabetical order' do

        garage = Garage.create(name: 'Beatles Garage')
        motorcycle = garage.motorcycles.create!(name: 'Mayo Type-S', ride_ready: false, model_year: 2019)

        visit "/garages/#{garage.id}/motorcycles"

        click_link_or_button 'Sort Motorcycles By Alphabetical Order'

        expect(current_path).to eq("/garages/#{garage.id}/motorcycles")
        expect(page).to have_content('Mayo Type-S')
      end
    end
  end
end
