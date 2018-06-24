# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/edit', type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
                                reviewer: 'MyString',
                                text: 'MyText'
                              ))
  end

  it 'renders the edit review form' do
    render

    assert_select 'form[action=?][method=?]', review_path(@review), 'post' do
      assert_select 'input[name=?]', 'review[reviewer]'

      assert_select 'textarea[name=?]', 'review[text]'
    end
  end
end
