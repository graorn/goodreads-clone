# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/show', type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
                                reviewer: 'Reviewer',
                                text: 'MyText'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Reviewer/)
    expect(rendered).to match(/MyText/)
  end
end
