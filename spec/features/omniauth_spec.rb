describe 'omniauth' do

  it "can log in with facebook" do
    visit root_path

    click_link 'Sign in with Facebook'

    click_link 'Log out'

    expect page.to have_content 'Log in'

  end
end
