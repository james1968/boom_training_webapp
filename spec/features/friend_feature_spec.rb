require 'spec_helper'
require 'rails_helper'
feature 'add a friend' do
  scenario 'as a user I want to be able to add another users as a friend' do
    sign_up_one
    expect(page).to have_content "Training Sessions"
    click_link 'Sign out'
    sign_up_two
    expect(page).to have_content "Training Sessions"
    click_link "Add a friend"
    fill_in :friendship_second_user_id, with: 'batman@hotmail.com'
    click_button 'Add Friend'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Friend added'
  end

  scenario 'a valid email must be used to create a friend' do
    sign_up_one
    expect(page).to have_content "Training Sessions"
    click_link 'Sign out'
    sign_up_two
    expect(page).to have_content "Training Sessions"
    click_link "Add a friend"
    click_button 'Add Friend'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Unable to create friendship'
  end
end
