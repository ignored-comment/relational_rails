require 'rails_helper'

RSpec.describe 'new motorcycle form', type: :feature do
  describe 'as a visitor' do
    describe 'when I visit the new motorcycle form' do
      it 'i can create a new motorcycle' do

        garage = Garage.create!(name: "Floops Garage")
        
        visit "/garages/#{garage.id}/motorcycles"

        click_link 'New Motorcycle'
        expect(current_path).to eq("/garages/#{garage.id}/motorcycles/new")

        fill_in "Name", with: "ZOOMIE ZOOMIE"
        check "ride_ready"
        fill_in 'model_year', with: 2020

        click_link_or_button "Create Motorcycle"

        expect(current_path).to eq("/garages/#{garage.id}/motorcycles")
        expect(page).to have_content("ZOOMIE ZOOMIE")
      end
    end
  end
end