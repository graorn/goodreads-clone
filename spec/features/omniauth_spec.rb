describe 'omniauth' do

  it "can log in with facebook" do
    visit root_path

    click_link 'Sign in with Facebook'
  end
end
