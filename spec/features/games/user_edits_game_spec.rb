require "rails_helper"

feature "Create game" do
  scenario "user edits game succesfully" do
    game = FactoryGirl.create(:game)
    location = game.location
    user = game.user
    sign_in_as(user)

    visit edit_location_game_path(location, game)
    fill_in "Name", with: "My game"
    fill_in "Time", with: "7:00"
    fill_in "Date", with: "12/12/2014"
    fill_in "Description", with: "Stuff"
    click_on "Submit"

    expect(page).to have_content "Game updated successfully!"
  end

  scenario "user fails to edit game succesfully - blank" do
    game = FactoryGirl.create(:game)
    location = game.location
    user = game.user
    sign_in_as(user)

    visit edit_location_game_path(location, game)
    fill_in "Name", with: ""
    fill_in "Time", with: ""
    fill_in "Date", with: ""
    fill_in "Description", with: ""

    click_on "Submit"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to edit game succesfully - blank name" do
    game = FactoryGirl.create(:game)
    location = game.location
    user = game.user
    sign_in_as(user)

    visit new_location_game_path(location)
    fill_in "Name", with: ""
    click_on "Submit"

    expect(page).to have_content "Name can't be blank"
  end

  scenario "user fails to edit game succesfully - blank time" do
    game = FactoryGirl.create(:game)
    location = game.location
    user = game.user
    sign_in_as(user)

    visit new_location_game_path(location)
    fill_in "Time", with: ""
    click_on "Submit"

    expect(page).to have_content "Time can't be blank"
  end

  scenario "user fails to edit game succesfully - blank date" do
    game = FactoryGirl.create(:game)
    location = game.location
    user = game.user
    sign_in_as(user)

    visit new_location_game_path(location)
    fill_in "Date", with: ""
    click_on "Submit"

    expect(page).to have_content "Date can't be blank"
  end

  scenario "user fails to edit game succesfully - blank escription" do
    game = FactoryGirl.create(:game)
    location = game.location
    user = game.user
    sign_in_as(user)

    visit new_location_game_path(location)
    fill_in "Description", with: ""
    click_on "Submit"

    expect(page).to have_content " Description can't be blank"
  end
end
