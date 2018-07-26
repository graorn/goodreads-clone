# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'ReadingLists', type: :feature do
  let!(:user) { create :user }
  let!(:book) { create :book }

  before(:each) { login_as(user, scope: :user) }

  it 'puts the book to a reading list', format: :js do
    visit(book_path(book))

    click_link 'Read'

    expect(page).to have_content "\"#{book.title}\" is placed in a reading list"
  end

  it 'removes the book from reading list' do
    visit(book_path(book))

    click_link 'Read'
    click_link 'Reading'

    expect(page).to have_content "Book \"#{book.title}\" is removed from reading list"
  end
end
