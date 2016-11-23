require 'spec_helper'
require 'rails_helper'


  feature 'log training sessions' do
    scenario 'as a user I want to be able to log my training sessions' do
      sign_up
      expect(page).to have_content "Training Sessions"
      click_link "Training Sessions"
      click_link 'New Training Session'
      click_button 'Create Training session'
      expect(page).to have_content ('Training session was successfully created.')
    end
  end
