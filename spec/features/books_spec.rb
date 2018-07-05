# frozen_string_literal: true

describe "books" do

  context 'when not favorited' do
    it "can be put to favorites" do
      visit root_path

      click_link 'Books'

      click_link 'Show'

      click_link 'Favorite'

      expect(page).to have_content('Unfavorite')
    end
  end

  it "can be put to a reading list"
  it "can be rated"
  it "can have reviews"
end


