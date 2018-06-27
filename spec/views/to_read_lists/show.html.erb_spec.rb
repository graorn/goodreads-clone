# frozen_string_literal: true

require "rails_helper"

RSpec.describe "to_read_lists/show", type: :view do
  before(:each) do
    @to_read_list = assign(:to_read_list, ToReadList.create!(
                                            user: nil,
                                            book: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
