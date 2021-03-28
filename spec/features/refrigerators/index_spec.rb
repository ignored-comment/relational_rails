require 'rails_helper'

RSpec.describe "refrigerator index page", type: :feature do
  it "can see the name of each refrigerator record in the system" do
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)

    visit "/refrigerators"

    expect(page).to have_content(refrigerator1.name)
    expect(page).to have_content(refrigerator1.created_at)
    expect(page).to have_content(refrigerator2.name)
    expect(page).to have_content(refrigerator2.created_at)
  end

  it "shows the number of foods in the refrigerator" do
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)

    visit "/refrigerators"

    expect(page).to have_content(refrigerator1.count_foods)
    expect(page).to have_content(refrigerator2.count_foods)
  end

  it "has a link to take me to the foods index" do
    refrigerator1 = Refrigerator.create!(name: "Kons Refrigerator", has_freezer: true, capacity_cubic_feet: 45)
    refrigerator2 = Refrigerator.create!(name: "Aidans Refrigerator", has_freezer: false, capacity_cubic_feet: 12)

    visit "/refrigerators"

    expect(page).to have_link("Full Foods Index")
    click_link "Full Foods Index"
    expect(current_path).to eq("/foods")

    visit "/refrigerators"

    expect(page).to have_link("Full Foods Index")
    click_link "Full Foods Index"
    expect(current_path).to eq("/foods")
  end

  it "has a link to create a new Refrigerator record, 'New Refrigerator' " do
    visit '/refrigerators'

    expect(page).to have_link('New Refrigerator')
    click_link 'New Refrigerator'
    expect(current_path).to eq('/refrigerators/new')
  end
end
