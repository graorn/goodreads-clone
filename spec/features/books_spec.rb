# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Books', type: :feature do
  user = FactoryBot.create(:user)

  before(:each) { login_as(user, scope: :user) }

  describe 'user favorites a book' do
    pending 'Database does not get cleaned after favoriting'

    context 'book is favorited' do
      it 'unfavorites the book'
    end

    context 'book is not favorited' do
      it 'favorites the book'
    end
  end
end
