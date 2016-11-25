require 'rails_helper'

feature 'groups' do

  before do
    sign_up
  end


  context 'When looking at groups' do
    scenario 'No groups created yet. Create one!' do
      visit '/groups'
      expect(page).to have_content 'No groups created yet. Create one!'
      expect(page).to have_link 'Create New Group'
    end

    scenario 'Groups can be added' do
      create_new_group
      expect(current_path).to eq "/groups/1"
      expect(page).to have_content 'Group was successfully created.'
    end

    scenario 'Groups can be edited' do
      create_new_group
      visit '/groups'
      click_link('Edit')
      fill_in 'Description', with: "2nd rule. You do not talk about fight club!"
      click_button('Create Group')
      expect(page).to have_content "2nd rule. You do not talk about fight club!"
    end

    scenario 'Must be signed in to create group' do
      sign_out
      visit '/groups/new'
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end

    scenario 'Groups can be deleted' do
      create_new_group
      visit '/groups'
      click_link('Destroy')
      page.driver{ click_link "OK" }
      expect(page).to have_content "Group was successfully destroyed."
    end

    scenario 'Cannot create a group without a name' do
      click_link('Create New Group')
      click_button('Create Group')
      expect(page).to have_content 'Name is too short (minimum is 1 character)'
    end
  end
end
