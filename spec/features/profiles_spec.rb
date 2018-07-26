# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User profile', type: :feature do
  let!(:user) { create :user }

  before(:each) { login_as(user, scope: :user) }

  it 'shows users name' do
    visit root_path

    expect(page).to have_content(user.name)
  end
end
