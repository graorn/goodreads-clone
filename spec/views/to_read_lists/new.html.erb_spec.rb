# frozen_string_literal: true

require "rails_helper"

RSpec.describe "to_read_lists/new", type: :view do
  before(:each) do
    assign(:to_read_list, ToReadList.new(
                            user: nil,
                            book: nil
    ))
  end

  it "renders new to_read_list form" do
    render

    assert_select "form[action=?][method=?]", to_read_lists_path, "post" do

      assert_select "input[name=?]", "to_read_list[user_id]"

      assert_select "input[name=?]", "to_read_list[book_id]"
    end
  end
end
