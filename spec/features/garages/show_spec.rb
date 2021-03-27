require 'rails_helper'

RSpec.describe "garages show page", type: :feature do
  it "from garage ID, it can see data from each column that is on the garage table" do 
    garage_1 = Garage.create!(name: "Kon's Garage", at_capacity: false, max_capacity: 4)
    garage_2 = Garage.create!(name: "Aidan's Garage", at_capacity: true, max_capacity: 2)

    visit "/garages/#{garage_1.id}" #TODO make dynamic?

    expect(page).to have_content(garage_1.created_at)
    expect(page).to have_content(garage_1.updated_at)
    expect(page).to have_content(garage_1.name)
    expect(page).to have_content(garage_1.id)
    expect(page).to have_content(garage_1.at_capacity)
    expect(page).to have_content(garage_1.max_capacity)

    visit "/garages/#{garage_2.id}"

    expect(page).to have_content(garage_2.created_at)
    expect(page).to have_content(garage_2.updated_at)
    expect(page).to have_content(garage_2.name)
    expect(page).to have_content(garage_2.id)
    expect(page).to have_content(garage_2.at_capacity)
    expect(page).to have_content(garage_2.max_capacity)
  end
end
