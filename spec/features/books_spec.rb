# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Books', type: :feature do
  user = FactoryBot.create(:user)

  before(:each) {login_as(user, :scope => :user)}

  describe 'user favorites a book' do
    pending 'Database does not get cleaned after favoriting'

    context 'book is favorited' do
      it 'unfavorites the book'
    end

    context 'book is not favorited' do
      it 'favorites the book'
    end
  end

  describe 'review' do
    it 'leaves a review for a book' do
      visit books_path

      find(:link, 'View Book').first.should be_visible


      click_link 'Add review'

      fill_in 'review_title', with: 'Test title'
      fill_in 'review_body', with: 'Test body review'
      fill_in 'review_rating', with: 5

      click_button 'Create Review'
    end
  end
end
