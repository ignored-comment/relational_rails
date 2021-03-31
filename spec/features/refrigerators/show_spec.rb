require "rails_helper"

RSpec.describe "refrigerator show page", type: :feature do
  it "from refrigerator ID, it can see data from each column that is on the refrigerator table" do 
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)
    
    visit "/refrigerators/#{refrigerator1.id}" #TODO figure out how to do this dynamically

    expect(page).to have_content(refrigerator1.name)
    expect(page).to have_content(refrigerator1.created_at)
    expect(page).to have_content(refrigerator1.updated_at)
    expect(page).to have_content(refrigerator1.id)
    expect(page).to have_content(refrigerator1.has_freezer)
    expect(page).to have_content(refrigerator1.capacity_cubic_feet)

    visit "/refrigerators/#{refrigerator2.id}"

    expect(page).to have_content(refrigerator2.name)
    expect(page).to have_content(refrigerator2.created_at)
    expect(page).to have_content(refrigerator2.updated_at)
    expect(page).to have_content(refrigerator2.id)
    expect(page).to have_content(refrigerator2.has_freezer)
    expect(page).to have_content(refrigerator2.capacity_cubic_feet)
  end

  it "can show a count of the number of foods associated with this refrigerator" do
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)

    food1 = refrigerator1.foods.create!(name: "apple", expired: true, total_items_available:12)
    food2 = refrigerator2.foods.create!(name: "snapple", expired: false, total_items_available:1)

    visit "/refrigerators/#{refrigerator1.id}"
    
    expect(page).to have_content(refrigerator1.count_foods)

    visit "/refrigerators/#{refrigerator1.id}"

    expect(page).to have_content(refrigerator2.count_foods)
  end

  it "has a link to take me to that refrigerators's foods page" do
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)

    visit "/refrigerators/#{refrigerator1.id}"

    expect(page).to have_link("Foods In This Refrigerator")
    click_link "Foods In This Refrigerator"
    expect(current_path).to eq("/refrigerators/#{refrigerator1.id}/foods")

    visit "/refrigerators/#{refrigerator2.id}"
    
    expect(page).to have_link("Foods In This Refrigerator")
    click_link "Foods In This Refrigerator"
    expect(current_path).to eq("/refrigerators/#{refrigerator2.id}/foods")
  end

  it "has a link to take me to the refrigerators index" do
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)

    visit "/refrigerators/#{refrigerator1.id}"

    expect(page).to have_link("Full Refrigerator Index")
    click_link "Full Refrigerator Index"
    expect(current_path).to eq("/refrigerators")

    visit "/refrigerators/#{refrigerator2.id}"

    expect(page).to have_link("Full Refrigerator Index")
    click_link "Full Refrigerator Index"
    expect(current_path).to eq("/refrigerators")
  end

  it "has a link to take me to the foods index" do
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)

    visit "/refrigerators/#{refrigerator1.id}"

    expect(page).to have_link("Full Foods Index")
    click_link "Full Foods Index"
    expect(current_path).to eq("/foods")

    visit "/refrigerators/#{refrigerator2.id}"

    expect(page).to have_link("Full Foods Index")
    click_link "Full Foods Index"
    expect(current_path).to eq("/foods")
  end

  it "can delete a refrigerator from the refrigerators table" do
    refrigerator = Refrigerator.create!(name: "Kon's Refrigerator", has_freezer: false, capacity_cubic_feet: 4)

    visit "/refrigerators/#{refrigerator.id}"

    expect(page).to have_content("Kon's Refrigerator")
    expect(page).to have_link("Delete Refrigerator")

    click_link "Delete Refrigerator"
    expect(current_path).to eq("/refrigerators")

    expect(page).to have_no_content("Kon's Refrigerator")
  end
end