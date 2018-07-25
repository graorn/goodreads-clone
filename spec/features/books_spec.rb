# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Books', type: :feature do
  let!(:user) { create :user }
  let!(:book) { create :book }

  before(:each) { login_as(user, scope: :user) }

  it 'favorites the book', format: :js do
    visit(book_path(book))

    click_link 'Favorite'

    expect(page).to have_content 'The book is placed in favorites'
  end

  it 'does not favorite the book if it is already favorited' do
    visit(book_path(book))

    click_link 'Favorite'
    click_link 'Favorite'

    expect(page).to have_content 'The book is NOT placed in favorites'
  end
end
