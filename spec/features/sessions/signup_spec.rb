require 'spec_helper'

feature "user sign-up" do
  scenario "the user registers with a password and password confirmation" do
    visit "/users/sign_up"
    fill_in :user_email, with: "batman@hotmail.com"
    fill_in :user_password, with: "123456"
    fill_in :user_password_confirmation, with: "123456"
    fill_in :user_mobile_number, with: '07866489244'
    click_button "Sign up"
    expect(page).to have_content "Training Sessions"
  end
end
