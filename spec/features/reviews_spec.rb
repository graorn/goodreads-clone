# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Reviews', type: :feature do
  let!(:user) { create :user }
  let!(:book) { create :book }
  let!(:admin) { create :user, admin: true }

  before(:each) { login_as(user, scope: :user) }

  it 'can be left on a book' do
    visit(book_path(book))

    click_link 'Add review'

    fill_in 'review_title', with: 'Test review title'
    fill_in 'review_content', with:  'Test review body'
    fill_in 'review_rating', with: 5

    click_button 'Create Review'

    expect(page).to have_content 'Created review'
  end

  it 'can be deleted by its poster' do
    pending

    visit(book_path(book))

    click_link 'Add review'

    fill_in 'review_title', with: 'Test review title'
    fill_in 'review_content', with:  'Test review body'
    fill_in 'review_rating', with: 5

    click_button 'Create Review'

    expect(page).to have_content 'Created review'



    find('fas fa-trash').click

    expect(page).to have_content 'Deleted review'
  end
end
