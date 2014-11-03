require "rails_helper"

feature "Create comment" do
  scenario "user creates comment succesfully" do
    game = FactoryGirl.create(:game)
    user = game.user
    sign_in_as(user)

    visit new_game_comment_path(game)
    fill_in "Body", with: "Comment"
    click_on "Submit"

    expect(page).to have_content "Comment created successfully!"
  end

  scenario "user fails to creates game succesfully - blank" do
    game = FactoryGirl.create(:game)
    user = game.user
    sign_in_as(user)

    visit new_game_comment_path(game)
    click_on "Submit"

    expect(page).to have_content "Body can't be blank"
  end
end
