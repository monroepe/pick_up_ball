require "rails_helper"

feature "Create location" do
  scenario "user creates location succesfully" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_location_path

    fill_in "Name", with: "Court 1"
    fill_in "Address", with: "123 Fake St"
    fill_in "City", with: "New York"
    fill_in "State", with: "NY"
    click_on "Submit"

    expect(page).to have_content "Court created successfully!"
  end

  scenario "user fails to creates location succesfully - blank" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_location_path
    click_on "Submit"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to creates location succesfully - blank name" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_location_path

    fill_in "Address", with: "123 Fake St"
    fill_in "City", with: "New York"
    fill_in "State", with: "NY"
    click_on "Submit"

    expect(page).to have_content "Name can't be blank"
  end

  scenario "user fails to creates location succesfully - blank address" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_location_path

    fill_in "Name", with: "Court1"
    fill_in "City", with: "New York"
    fill_in "State", with: "NY"
    click_on "Submit"

    expect(page).to have_content "Address can't be blank"
  end

  scenario "user fails to creates location succesfully - blank city" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_location_path

    fill_in "Name", with: "Court1"
    fill_in "Address", with: "123 Fake St"
    fill_in "State", with: "NY"
    click_on "Submit"

    expect(page).to have_content "City can't be blank"
  end

  scenario "user fails to creates location succesfully - blank state" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_location_path

    fill_in "Name", with: "Court1"
    fill_in "Address", with: "123 Fake St"
    fill_in "City", with: "New York"
    click_on "Submit"

    expect(page).to have_content "State can't be blank"
  end

  scenario "user fails to creates location succesfully - fake state" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_location_path

    fill_in "Name", with: "Court1"
    fill_in "Address", with: "123 Fake St"
    fill_in "City", with: "New York"
    fill_in "State", with: "JK"
    click_on "Submit"

    expect(page).to have_content "State must be real"
  end
end
