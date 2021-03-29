require 'rails_helper'

RSpec.describe 'New Garage' do
  describe 'As a visitor' do
    describe 'When I visit the garages index' do
      it 'I can update a garage' do
        garage = Garage.create(name: 'Beatles Garage')

        visit "/garages/#{garage.id}"

        click_link_or_button 'Update Garage'

        expect(current_path).to eq("/garages/#{garage.id}/edit")

        fill_in 'Name', with: 'The Beatles Garage'
        check "at_capacity"
        fill_in 'max_capacity', with: 99
        click_on 'Update Garage'

        expect(current_path).to eq("/garages/#{garage.id}")
        expect(page).to have_content('The Beatles Garage')
      end
    end
  end
end