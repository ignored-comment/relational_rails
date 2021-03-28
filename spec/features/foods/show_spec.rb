require "rails_helper"

RSpec.describe "foods show page", type: :feature do
  it "from food ID, it can see data from each column that is on the food table" do 
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)
    
    food1 = refrigerator1.foods.create!(name: "apple", expired: true, total_items_available:12)
    food2 = refrigerator1.foods.create!(name: "snapple", expired: false, total_items_available:1)
    
    food3 = refrigerator2.foods.create!(name: "yogurt", expired: true, total_items_available:8)
    food4 = refrigerator2.foods.create!(name: "carrot", expired: false, total_items_available:5)
    
    visit "/foods/#{food1.id}" #TODO figure out how to do this dynamically

    expect(page).to have_content(food1.name)
    expect(page).to have_content(food1.created_at)
    expect(page).to have_content(food1.updated_at)
    expect(page).to have_content(food1.id)
    expect(page).to have_content(food1.refrigerator_id)
    expect(page).to have_content(food1.expired)
    expect(page).to have_content(food1.total_items_available)

    visit "/foods/#{food2.id}"

    expect(page).to have_content(food2.name)
    expect(page).to have_content(food2.created_at)
    expect(page).to have_content(food2.updated_at)
    expect(page).to have_content(food2.id)
    expect(page).to have_content(food2.refrigerator_id)
    expect(page).to have_content(food2.expired)
    expect(page).to have_content(food2.total_items_available)

    visit "/foods/#{food3.id}"

    expect(page).to have_content(food3.name)
    expect(page).to have_content(food3.created_at)
    expect(page).to have_content(food3.updated_at)
    expect(page).to have_content(food3.id)
    expect(page).to have_content(food3.refrigerator_id)
    expect(page).to have_content(food3.expired)
    expect(page).to have_content(food3.total_items_available)

    visit "/foods/#{food4.id}"

    expect(page).to have_content(food4.name)
    expect(page).to have_content(food4.created_at)
    expect(page).to have_content(food4.updated_at)
    expect(page).to have_content(food4.id)
    expect(page).to have_content(food4.refrigerator_id)
    expect(page).to have_content(food4.expired)
    expect(page).to have_content(food4.total_items_available)
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

    it "has a link to take me to the foods index" do
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)

    food1 = refrigerator1.foods.create!(name: "apple", expired: true, total_items_available:12)
    food2 = refrigerator2.foods.create!(name: "snapple", expired: false, total_items_available:1)

    visit "/foods/#{food1.id}"

    expect(page).to have_link("Full Foods Index")
    click_link "Full Foods Index"
    expect(current_path).to eq("/foods")

    visit "/foods/#{food2.id}"

    expect(page).to have_link("Full Foods Index")
    click_link "Full Foods Index"
    expect(current_path).to eq("/foods")
  end
end