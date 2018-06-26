# frozen_string_literal: true

require 'rails_helper'

describe 'Authentication' do
  context 'when not signed up' do
    it 'is able to sign up' do
      visit root_path

      click_link 'Sign up'

      fill_in 'user_email', with: 'tester@testdomain.test'
      fill_in 'user_password', with: 'pa$$word'
      fill_in 'user_password_confirmation', with: 'pa$$word'

      click_button 'Sign up'

      message = 'Welcome! You have signed up successfully.'

      expect(page).to have_content(message)
    end
  end

  context 'when signed up' do
    it 'is able to login' do
      visit root_path

      click_link 'Sign in'

      @registered_user = FactoryBot.create(
        :user,
        email: 'tester@testdomain.test',
        password: 'pa$$word'
      )

      fill_in 'user_email', with: 'tester@testdomain.test'
      fill_in 'user_password', with: 'pa$$word'

      click_button 'Log in'

      expect(page).to have_content('Signed in')
    end
  end

  context 'when logged in' do
    it 'is able to logout' do
      visit root_path

      click_link 'Sign in'

      @registered_user = FactoryBot.create(
        :user,
        email: 'tester@testdomain.test',
        password: 'pa$$word'
      )

      fill_in 'user_email', with: 'tester@testdomain.test'
      fill_in 'user_password', with: 'pa$$word'

      click_button 'Log in'
      click_link 'Log out'

      expect(page).to have_content('Signed out successfully.')
    end
  end
end
