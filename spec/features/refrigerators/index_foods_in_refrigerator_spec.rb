require 'rails_helper'

RSpec.describe 'food index page via parent refrigerator', type: :feature do
  it "can see the foods associated with that refrigerator_id including all of the foods attributes" do

    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)

    food1 = refrigerator1.foods.create!(name: "apple", expired: true, total_items_available:12)
    food2 = refrigerator1.foods.create!(name: "snapple", expired: false, total_items_available:1)
    
    food3 = refrigerator2.foods.create!(name: "yogurt", expired: true, total_items_available:8)
    food4 = refrigerator2.foods.create!(name: "carrot", expired: false, total_items_available:5)

    visit "/refrigerators/#{refrigerator1.id}/foods"

    expect(page).to have_content(food1.id)
    expect(page).to have_content(food1.refrigerator_id)
    expect(page).to have_content(food1.created_at)
    expect(page).to have_content(food1.updated_at)
    expect(page).to have_content(food1.expired)
    expect(page).to have_content(food1.total_items_available)

    visit "/refrigerators/#{refrigerator1.id}/foods"

    expect(page).to have_content(food2.id)
    expect(page).to have_content(food2.refrigerator_id)
    expect(page).to have_content(food2.created_at)
    expect(page).to have_content(food2.updated_at)
    expect(page).to have_content(food2.expired)
    expect(page).to have_content(food2.total_items_available)

    visit "/refrigerators/#{refrigerator2.id}/foods"

    expect(page).to have_content(food3.id)
    expect(page).to have_content(food3.refrigerator_id)
    expect(page).to have_content(food3.created_at)
    expect(page).to have_content(food3.updated_at)
    expect(page).to have_content(food3.expired)
    expect(page).to have_content(food3.total_items_available)

    visit "/refrigerators/#{refrigerator2.id}/foods"

    expect(page).to have_content(food4.id)
    expect(page).to have_content(food4.refrigerator_id)
    expect(page).to have_content(food4.created_at)
    expect(page).to have_content(food4.updated_at)
    expect(page).to have_content(food4.expired)
    expect(page).to have_content(food4.total_items_available)
  end
end