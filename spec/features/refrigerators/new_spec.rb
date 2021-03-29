require 'rails_helper'

RSpec.describe 'new refrigerator form', type: :feature do
  describe 'as a visitor' do
    describe 'when I visit the new refrigerator form' do
      it 'i can create a new refrigerator' do
        visit '/refrigerators'

        click_link 'New Refrigerator'

        expect(current_path).to eq('/refrigerators/new')

        fill_in "Name", with: "Koops Refrigerator"
        check "has_freezer"
        fill_in 'capacity_cubic_feet', with: 10

        click_link_or_button "Create Refrigerator"

        expect(current_path).to eq('/refrigerators')
        expect(page).to have_content("Koops Refrigerator")
      end
    end
  end
end