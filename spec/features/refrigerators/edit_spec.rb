require 'rails_helper'

RSpec.describe 'New Refrigerator' do
  describe 'As a visitor' do
    describe 'When I visit the refrigerators index' do
      it 'I can update a refrigerator' do
        refrigerator = Refrigerator.create(name: 'Beatles Refrigerator')

        visit "/refrigerators/#{refrigerator.id}"

        click_link_or_button 'Update Refrigerator'

        expect(current_path).to eq("/refrigerators/#{refrigerator.id}/edit")

        fill_in 'Name', with: 'The Beatles Refrigerator'
        check "has_freezer"
        fill_in 'capacity_cubic_feet', with: 99
        click_on 'Update Refrigerator'

        expect(current_path).to eq("/refrigerators/#{refrigerator.id}")
        expect(page).to have_content('The Beatles Refrigerator')
      end
    end
  end
end