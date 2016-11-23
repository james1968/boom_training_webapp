require 'spec_helper'


  feature 'log training sessions' do
    scenario 'as a user I want to be able to log my training sessions' do
      visit "/users/sign_up"
      fill_in :user_email, with: "batman@hotmail.com"
      fill_in :user_password, with: "123456"
      fill_in :user_password_confirmation, with: "123456"
      # fill_in :user_mobile_number, with:''
      click_button "Sign up"
      expect(page).to have_content "Training Sessions"
      click_link "Training Sessions"
      click_link "New Training Session"
      click_button 'Create Training session'
      expect(page).to have_content ('Training session was successfully created.')
    end
  end
