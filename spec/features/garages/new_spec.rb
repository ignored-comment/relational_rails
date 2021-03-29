require 'rails_helper'

RSpec.describe 'new garage form', type: :feature do
  describe 'as a visitor' do
    describe 'when I visit the new garage form' do
      it 'i can create a new garage' do
        visit '/garages'

        click_link 'New Garage'

        expect(current_path).to eq('/garages/new')

        fill_in "Name", with: "Koops Garage"
        check "at_capacity"
        fill_in 'max_capacity', with: 99

        click_link_or_button "Create Garage"

        expect(current_path).to eq('/garages')
        expect(page).to have_content("Koops Garage")
      end
    end
  end
end