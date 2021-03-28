require 'rails_helper'

RSpec.describe 'motorcycle index page', type: :feature do
  it "can see the motorcyle with that id including the motorcyle's attributes" do
    garage_1 = Garage.create!(name: "Kon's Garage", at_capacity: false, max_capacity: 4)
    garage_2 = Garage.create!(name: "Aidan's Garage", at_capacity: true, max_capacity: 2)

    motorcycle_1 = garage_1.motorcycles.create!(name: "ZoomZoom X1", ride_ready: true, model_year: 2050)
    motorcycle_2 = garage_1.motorcycles.create!(name: "BoomBoom X1-zdf23", ride_ready: false, model_year: 2010)
    motorcycle_3 = garage_2.motorcycles.create!(name: "VroomVroom X-Wowza-so-fast", ride_ready: true, model_year: 1969)
    motorcycle_4 = garage_2.motorcycles.create!(name: "AYYY LAMO X1", ride_ready: false, model_year: 2190)

    visit "/motorcycles/#{motorcycle_1.id}"

    expect(page).to have_content(motorcycle_1.id)
    expect(page).to have_content(motorcycle_1.garage_id)
    expect(page).to have_content(motorcycle_1.created_at)
    expect(page).to have_content(motorcycle_1.updated_at)
    expect(page).to have_content(motorcycle_1.ride_ready)
    expect(page).to have_content(motorcycle_1.model_year)

    visit "/motorcycles/#{motorcycle_2.id}"

    expect(page).to have_content(motorcycle_2.id)
    expect(page).to have_content(motorcycle_2.garage_id)
    expect(page).to have_content(motorcycle_2.created_at)
    expect(page).to have_content(motorcycle_2.updated_at)
    expect(page).to have_content(motorcycle_2.ride_ready)
    expect(page).to have_content(motorcycle_2.model_year)

    visit "/motorcycles/#{motorcycle_3.id}"

    expect(page).to have_content(motorcycle_3.id)
    expect(page).to have_content(motorcycle_3.garage_id)
    expect(page).to have_content(motorcycle_3.created_at)
    expect(page).to have_content(motorcycle_3.updated_at)
    expect(page).to have_content(motorcycle_3.ride_ready)
    expect(page).to have_content(motorcycle_3.model_year)

    visit "/motorcycles/#{motorcycle_4.id}"

    expect(page).to have_content(motorcycle_4.id)
    expect(page).to have_content(motorcycle_4.garage_id)
    expect(page).to have_content(motorcycle_4.created_at)
    expect(page).to have_content(motorcycle_4.updated_at)
    expect(page).to have_content(motorcycle_4.ride_ready)
    expect(page).to have_content(motorcycle_4.model_year)
  end

  it "has a link to take me to the refrigerators index" do
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)

    food1 = refrigerator1.foods.create!(name: "apple", expired: true, total_items_available:12)
    food2 = refrigerator2.foods.create!(name: "snapple", expired: false, total_items_available:1)

    visit "/foods/#{food1.id}"

    expect(page).to have_link("Full Refrigerator Index")
    click_link "Full Refrigerator Index"
    expect(current_path).to eq("/refrigerators")

    visit "/foods/#{food2.id}"

    expect(page).to have_link("Full Refrigerator Index")
    click_link "Full Refrigerator Index"
    expect(current_path).to eq("/refrigerators")
  end
end