# frozen_string_literal: true

require "rails_helper"

RSpec.describe "to_read_lists/index", type: :view do
  before(:each) do
    assign(:to_read_lists, [
      ToReadList.create!(
        user: nil,
        book: nil
      ),
      ToReadList.create!(
        user: nil,
        book: nil
      )
    ])
  end

  it "renders a list of to_read_lists" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
