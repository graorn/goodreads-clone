# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Books', type: :feature do
  let!(:user) { create :user }
  let!(:book) { create :book }
  let!(:admin) { create :user, admin: true }


  context 'by user' do
    before(:each) do
      login_as(user, scope: :user)
      visit book_path(book)
    end

    it 'can not edit a book' do
      within '.btn-group' do
        expect(page).to_not have_content 'Edit'
      end
    end

    it 'favorites the book', format: :js do
      click_link 'Favorite'

      expect(page).to have_content 'The book is placed in favorites'
    end

    it 'unfavorites the book' do
      click_link 'Favorite'
      click_link 'Favorite'

      expect(page).to have_content "Book \"#{book.title}\" is removed from favorites"
    end
  end

  context 'by admin' do
    before(:each) { login_as(admin, scope: :user) }

    it 'can be edited' do
      visit book_path(book)

      click_link 'Edit'

      fill_in 'book_title', with: 'Edited book title'

      click_button 'Update Book'

      expect(page).to have_content 'Book was successfully updated.'
    end

    it 'can be deleted' do
      visit book_path(book)

      click_link 'Delete'

      expect(page).to have_content 'Book was successfully deleted.'
    end
  end
end
