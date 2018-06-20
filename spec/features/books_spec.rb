# frozen_string_literal: true

describe 'books' do
  it 'are showed in a list' do
    visit books_path

    expect page.to have_content('All books')
  end

  it 'can be put to favorites' do
    visit books_path

    click button
  end

  it 'can be put to a reading list' do
    return false
  end

  it 'can be rated' do
    return false
  end

  it 'can have reviews' do
    return false
  end
end
