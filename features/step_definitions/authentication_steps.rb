# frozen_string_literal: true

Given('I visit the homepage') do
  visit root_path
end

When('I fill in the sign up form') do
  click_link 'Sign up'

  fill_in 'user_email', with: 'tester@testdomain.test'
  fill_in 'user_password', with: 'pa$$word'
  fill_in 'user_password_confirmation', with: 'pa$$word'

  click_button 'Sign up'
end

Then('I should see that my account is confirmed') do
  message = 'Welcome! You have signed up successfully.'

  expect(page).to have_content(message)
end

Given('I am a registered user') do
  @registered_user = FactoryBot.create(
    :user,
    email: 'tester@testdomain.test',
    password: 'pa$$word'
  )
end

When('I fill in the login form') do
  fill_in 'user_email', with: 'tester@testdomain.test'
  fill_in 'user_password', with: 'pa$$word'

  click_button 'Log in'
end

Then('I should be logged in') do
  expect(page).to have_content('Signed in')
end

Given('I am logged in') do
  visit root_path

  fill_in 'user_email', with: 'tester@testdomain.test'
  fill_in 'user_password', with: 'pa$$word'

  click_button 'Log in'
end

When('I click on the log out button') do
  click_link 'Log out'
end

Then('I should be redirected to the log in page') do
  expect(page).to have_content('Log in')
end
