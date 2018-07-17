# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Books", type: :feature do
  scenario "user favorites a book" do
    pending

    visit books_path

    click_link "View Book"

    click_link "Favorite"
    expect(page).to have_content "Favorited"
  end
end
