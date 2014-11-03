require "rails_helper"

feature "Delete game" do
  scenario "user deletes game succesfully" do
    game = FactoryGirl.create(:game)
    location = game.location
    user = game.user
    sign_in_as(user)

    visit location_game_path(location, game)
    click_on "Delete Game"

    expect(page).to have_content "Game deleted successfully!"
  end
end
