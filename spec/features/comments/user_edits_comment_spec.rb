require "rails_helper"

feature "Update comment" do
  scenario "user edits comment succesfully" do
    comment = FactoryGirl.create(:comment)
    user = comment.user
    sign_in_as(user)

    visit edit_game_comment_path(comment.game, comment)
    fill_in "Body", with: "Comment"
    click_on "Submit"

    expect(page).to have_content "Comment updated successfully!"
  end

  scenario "user fails to edits game succesfully - blank" do
    comment = FactoryGirl.create(:comment)
    user = comment.user
    sign_in_as(user)

    visit edit_game_comment_path(comment.game, comment)
    fill_in "Body", with: ""
    click_on "Submit"

    expect(page).to have_content "Body can't be blank"
  end
end
