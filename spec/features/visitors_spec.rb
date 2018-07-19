# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visitors', type: :feature do
  let!(:user) { build :user }

  describe 'Account creation' do
    before(:each) do
      visit new_user_registration_path
    end

    scenario 'submit empty form' do
      click_button 'Sign up'

      expect(page).to have_content 'Please review the problems below:'
    end

    scenario 'do not enter email' do
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password

      click_button 'Sign up'

      expect(page).to have_content "Email can't be blank"
    end

    scenario 'do not enter password' do
      fill_in 'user_email', with: user.email

      click_button 'Sign up'

      expect(page).to have_content "Password can't be blank"
    end

    scenario 'submit valid data' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password

      click_button 'Sign up'

      expect(page).to have_content 'Welcome! You have signed up successfully. '
    end

    scenario 'navigate to books path' do
      visit books_path

      expect(page).to have_content 'You need to sign in or sign up before continuing. '
    end
  end
end
