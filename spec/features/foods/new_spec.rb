require 'rails_helper'

RSpec.describe 'new food form', type: :feature do
  describe 'as a visitor' do
    describe 'when I visit the new food form' do
      it 'i can create a new food' do

        refrigerator = Refrigerator.create!(name: "Floops Refrigerator")
        
        visit "/refrigerators/#{refrigerator.id}/foods"

        click_link 'New Food'
        expect(current_path).to eq("/refrigerators/#{refrigerator.id}/foods/new")

        fill_in "Name", with: "Goop"
        check "expired"
        fill_in 'total_items_available', with: 10

        click_link_or_button "Create Food"

        expect(current_path).to eq("/refrigerators/#{refrigerator.id}/foods")
        expect(page).to have_content("Goop")
      end
    end
  end
end