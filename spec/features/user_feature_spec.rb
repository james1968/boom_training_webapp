require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign Out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_on ('Sign Up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_on ('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign Out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_button('Sign In')
      expect(page).not_to have_button('Sign Up')
    end
  end

  feature "User can join a group" do
    it "should see button to join group in Group page" do
    sign_up_one
    expect(page).to have_content "Training Sessions"
    create_new_group
    expect(page).to have_content 'Group was successfully created'
    click_link 'Sign Out'
    sign_up_two
    click_link('All Groups')
    click_link('Show')
    click_link('Join')
    expect(page).to have_content('Successfully joined the group')
    end
  end






end
