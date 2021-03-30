require 'rails_helper'

RSpec.describe 'Update Motorcycle' do
  describe 'As a visitor' do
    describe 'When I visit the motorcycles index' do
      it 'I can update a motorcycle' do
        garage = Garage.create(name: 'Beatles Garage')
        motorcycle = garage.motorcycles.create!(name: 'Mayo Type-S', ride_ready: false, model_year: 2019)

        visit "/motorcycles/#{motorcycle.id}"

        click_link_or_button 'Update Motorcycle'

        expect(current_path).to eq("/motorcycles/#{motorcycle.id}/edit")

        fill_in 'Name', with: 'Fancy Mayo Type-S'
        check "ride_ready"
        fill_in 'model_year', with: 2019
        click_on 'Update Motorcycle'

        expect(current_path).to eq("/motorcycles/#{motorcycle.id}")
        expect(page).to have_content('Fancy Mayo Type-S')
      end
    end
  end
end