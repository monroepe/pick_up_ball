require "rails_helper"

feature "Create location" do
  scenario "user edits location succesfully" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit edit_location_path(location)
    fill_in "Name", with: "Court 1"
    fill_in "Address", with: "123 Fake St"
    fill_in "City", with: "New York"
    fill_in "State", with: "NY"
    click_on "Submit"

    expect(page).to have_content "Court updated successfully!"
  end

  scenario "user fails to edit location succesfully - blank" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit edit_location_path(location)

    fill_in "Name", with: ""
    fill_in "Address", with: ""
    fill_in "City", with: ""
    fill_in "State", with: ""
    click_on "Submit"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to edit location succesfully - blank name" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit edit_location_path(location)
    fill_in "Name", with: ""
    click_on "Submit"

    expect(page).to have_content "Name can't be blank"
  end

  scenario "user fails to edit location succesfully - blank address" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit edit_location_path(location)
    fill_in "Address", with: ""
    click_on "Submit"

    expect(page).to have_content "Address can't be blank"
  end

  scenario "user fails to edit location succesfully - blank city" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit edit_location_path(location)
    fill_in "City", with: ""
    click_on "Submit"

    expect(page).to have_content "City can't be blank"
  end

  scenario "user fails to edit location succesfully - blank state" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit edit_location_path(location)
    fill_in "State", with: ""
    click_on "Submit"

    expect(page).to have_content "State can't be blank"
  end

  scenario "user fails to edit location succesfully - fake state" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit edit_location_path(location)
    fill_in "State", with: "JK"
    click_on "Submit"

    expect(page).to have_content "State must be real"
  end
end
