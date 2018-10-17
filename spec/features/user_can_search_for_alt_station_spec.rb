require 'rails_helper'

feature "user can visit root page" do
  scenario "and fill the search form to find nearest alt station" do
    file = File.open("./fixtures/all_stations.json")
    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?fuel_type=ELEC,LPG&location=80203&radius=6.0&limit=10")
      .to_return(body: file, status: 200)

    visit "/"

    fill_in :q, with: 80203
    click_on "Locate"

    expect(current_path).to eq("/search")

    expect(page).to have_content("10 Results")
    expect(page).to have_css(".station", count: 10)

    within(first(".station")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_types")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".access_times")
    end
  end
end
