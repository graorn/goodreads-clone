# frozen_string_literal: true

describe 'omniauth' do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  let(:user) { create(:user) } 

  it 'can log in with facebook' do
    visit root_path
    
    click_link 'Sign in with Facebook'

    # save_and_open_page
    # fill_in "user_email", with: "test@tester.test"
    # fill_in "user_password", with: "pa$$word"
    # fill_in "user_password_confirmation", with: "pa$$word"


    expect(page).to have_content('Successfully authenticated from Facebook account.')
  end
end
