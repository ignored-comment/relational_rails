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

  it "shows the number of motorcycles in the garage" do
    garage_1 = Garage.create!(name: "Kon's Garage", at_capacity: false, max_capacity: 4)
    garage_2 = Garage.create!(name: "Aidan's Garage", at_capacity: true, max_capacity: 2)

    visit "/garages"

    expect(page).to have_content(garage_1.count_motorcycles)
    expect(page).to have_content(garage_2.count_motorcycles)
  end

  it "has a link to take me to the motorcycles index" do
    garage_1 = Garage.create!(name: "Kon's Garage", at_capacity: false, max_capacity: 4)
    garage_2 = Garage.create!(name: "Aidan's Garage", at_capacity: true, max_capacity: 2)

    visit "/garages/#{garage_1.id}"

    expect(page).to have_link("Full Motorcycle Index")
    click_link "Full Motorcycle Index"
    expect(current_path).to eq("/motorcycles")

    visit "/garages/#{garage_2.id}"

    expect(page).to have_link("Full Motorcycle Index")
    click_link "Full Motorcycle Index"
    expect(current_path).to eq("/motorcycles")
  end

  it "has a link to create a new Garage record, 'New Garage' " do
    visit '/garages'

    expect(page).to have_link('New Garage')
    click_link 'New Garage'
    expect(current_path).to eq('/garages/new')
  end

  it 'I can delete an garage' do
    garage = Garage.create(name: 'Talking Heads Garage')

    visit '/garages'

    click_link 'Delete Garage'

    expect(current_path).to eq('/garages')
    expect(page).to_not have_content(garage.name)
    expect(page).to_not have_link('Delete Motorcycle')
  end
end
