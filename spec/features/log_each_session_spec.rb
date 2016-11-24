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

  scenario 'must be logged in to log a session' do
    visit '/training_sessions/new'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'as a user I want to be able to plan my training sessions' do
    sign_up
    expect(page).to have_content "Training Sessions"
    click_link "Training Sessions"
    click_link 'New Training Session'
    find('#training_session_start_time_1i').find(:option, '2017').select_option
    find('#training_session_start_time_2i').find(:option, 'December').select_option
    find('#training_session_start_time_3i').find(:option, '1').select_option
    find('#training_session_start_time_4i').find(:option, '14').select_option
    find('#training_session_start_time_5i').find(:option, '30').select_option
    click_button 'Create Training session'
    expect(page).to have_content ('Training session was successfully created.')
    expect(page).to have_content ('2017-12-01 14:30:00 UTC')
  end
end
