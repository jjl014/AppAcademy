require 'rails_helper'
require 'spec_helper'

RSpec.feature "Auths", type: :feature do
  feature 'the signup process' do
    scenario 'has a new user page' do
      visit new_user_path
      expect(page).to have_content("New User")
    end

    feature 'signing up a user' do
      before(:each) do
        visit new_user_url
        fill_in 'Username', with: "helloworld"
        fill_in 'Password', with: "good_password"
        click_on 'Create User'
      end

      scenario 'shows username on the homepage after signup' do
        expect(page).to have_content("All Users")
      end
    end
  end

  feature 'logging in' do
    before(:each) do
      create_user("helloworld", "good_password")
      visit new_session_url
      fill_in 'Username', with: "helloworld"
      fill_in 'Password', with: "good_password"
      click_on 'Sign In'
    end
    scenario 'shows username on the homepage after login' do
      expect(page).to have_content("hello")
    end

  end

  feature 'logging out' do

    scenario 'begins with a logged out state' do
      visit users_url
      expect(page).to_not have_content("Sign Out")
    end

    scenario 'doesn\'t show username on the homepage after logout' do
      create_user("helloworld", "good_password")
      visit new_session_url
      fill_in 'Username', with: "helloworld"
      fill_in 'Password', with: "good_password"
      save_and_open_page
      click_on 'Sign In'
      click_on 'Sign Out'
      expect(page).to_not have_content("helloworld")
    end
  end
end
