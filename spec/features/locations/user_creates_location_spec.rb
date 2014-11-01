require "rails_helper"

feature "Create location" do
  scenario "user creates location succesfully" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_location_path

    fill_in "Name", with: "Court 1"
    fill_in "Address", with: "123 Fake St"
    fill_in "City", with: "New York"
    fill_in "Address", with: "NY"
    click_on "Submit"

    expect(page).to have_content "Court created successfully!"
  end

  scenario "user fails to creates location succesfully - blank" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_location_path

    expect(page).to have_content "Court created successfully!"
  end
end
