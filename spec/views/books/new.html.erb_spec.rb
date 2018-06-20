# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/new', type: :view do
  before(:each) do
    assign(:book, Book.new(
                    title: 'MyString',
                    author: 'MyString',
                    genre: 'MyString',
                    description: 'MyString',
                    rating: 1,
                    review: 'MyText',
                    favorite: false,
                    to_read: false
                  ))
  end

  it 'renders new book form' do
    render

    assert_select 'form[action=?][method=?]', books_path, 'post' do
      assert_select 'input[name=?]', 'book[title]'

      assert_select 'input[name=?]', 'book[author]'

      assert_select 'input[name=?]', 'book[genre]'

      assert_select 'input[name=?]', 'book[description]'

      assert_select 'input[name=?]', 'book[rating]'

      assert_select 'textarea[name=?]', 'book[review]'

      assert_select 'input[name=?]', 'book[favorite]'

      assert_select 'input[name=?]', 'book[to_read]'
    end
  end
end
