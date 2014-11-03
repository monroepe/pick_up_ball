require "rails_helper"

feature "Create game" do
  scenario "user creates game succesfully" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit new_location_game_path(location)
    fill_in "Name", with: "My game"
    fill_in "Time", with: "7:00"
    fill_in "Date", with: "12/12/2014"
    fill_in "Description", with: "Stuff"
    click_on "Submit"

    expect(page).to have_content "Game created successfully!"
  end

  scenario "user fails to creates game succesfully - blank" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit new_location_game_path(location)
    click_on "Submit"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to creates game succesfully - blank name" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit new_location_game_path(location)
    fill_in "Time", with: "7:00"
    fill_in "Date", with: "12/12/2014"
    fill_in "Description", with: "Stuff"
    click_on "Submit"

    expect(page).to have_content "Name can't be blank"
  end

  scenario "user fails to creates game succesfully - blank time" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit new_location_game_path(location)
    fill_in "Name", with: "My game"
    fill_in "Date", with: "12/12/2014"
    fill_in "Description", with: "Stuff"
    click_on "Submit"

    expect(page).to have_content "Time can't be blank"
  end

  scenario "user fails to creates game succesfully - blank date" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit new_location_game_path(location)
    fill_in "Name", with: "My game"
    fill_in "Time", with: "7:00"
    fill_in "Description", with: "Stuff"
    click_on "Submit"

    expect(page).to have_content "Date can't be blank"
  end

  scenario "user fails to creates game succesfully - blank escription" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit new_location_game_path(location)
    fill_in "Name", with: "My game"
    fill_in "Time", with: "7:00"
    fill_in "Date", with: "12/12/2014"
    click_on "Submit"

    expect(page).to have_content " Description can't be blank"
  end
end
