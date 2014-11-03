require "rails_helper"

feature "Delete comment" do
  scenario "user deletes comment succesfully" do
    comment = FactoryGirl.create(:comment)
    user = comment.user
    sign_in_as(user)

    visit location_game_path(comment.game.location, comment.game)
    click_on "Delete"

    expect(page).to have_content "Comment deleted successfully!"
  end
end
