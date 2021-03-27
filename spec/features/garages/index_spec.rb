require 'rails_helper'

RSpec.describe 'garages index page', type: :feature do
  it "can see the name of each garage record in the system" do 
    garage_1 = Garage.create!(name: "Kon's Garage", at_capacity: false, max_capacity: 4)
    garage_2 = Garage.create!(name: "Aidan's Garage", at_capacity: true, max_capacity: 2)

    visit '/garages'
    expect(page).to have_content(garage_1.name)
    expect(page).to have_content(garage_1.created_at)
    expect(page).to have_content(garage_2.name)
    expect(page).to have_content(garage_2.created_at)
  end
end
