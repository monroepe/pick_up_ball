require "rails_helper"

feature "Delete location" do
  scenario "user deletes location succesfully" do
    location = FactoryGirl.create(:location)
    user = location.user
    sign_in_as(user)

    visit location_path(location)
    click_on "Delete Court"

    expect(page).to have_content "Court deleted successfully!"
  end
end
