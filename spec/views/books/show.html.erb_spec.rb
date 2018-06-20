# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/show', type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
                            title: 'Title',
                            author: 'Author',
                            genre: 'Genre',
                            description: 'Description',
                            rating: 2,
                            review: 'MyText',
                            favorite: false,
                            to_read: false
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Genre/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
