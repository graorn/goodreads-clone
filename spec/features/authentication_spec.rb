describe "Authentication" do
  it "should be able to sign up" do
    visit root_path

    click_link 'Sign up'

    fill_in 'user_email', with: 'tester@testdomain.test'
    fill_in 'user_password', with: 'pa$$word'
    fill_in 'user_password_confirmation', with: 'pa$$word'

    click_button 'Sign up'

    message = 'Welcome! You have signed up successfully.'

    expect(page).to have_content(message)
  end

  it "should be able to login" do
    visit root_path

    @registered_user = FactoryBot.create(
        :user,
        :email => 'tester@testdomain.test',
        :password => 'pa$$word')

    fill_in 'user_email', with: 'tester@testdomain.test'
    fill_in 'user_password', with: 'pa$$word'

    click_button 'Log in'

    expect(page).to have_content('Signed in')
  end

  it "should be able to logout" do
    visit root_path

    fill_in 'user_email', with: 'tester@testdomain.test'
    fill_in 'user_password', with: 'pa$$word'

    click_button 'Log in'

    click_link 'Log out'

    expect(page).to have_content('Log in')

  end
end