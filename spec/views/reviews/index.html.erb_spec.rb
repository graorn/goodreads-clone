# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/index', type: :view do
  before(:each) do
    assign(:reviews, [
             Review.create!(
               reviewer: 'Reviewer',
               text: 'MyText'
             ),
             Review.create!(
               reviewer: 'Reviewer',
               text: 'MyText'
             )
           ])
  end

  it 'renders a list of reviews' do
    render
    assert_select 'tr>td', text: 'Reviewer'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
