# frozen_string_literal: true

require "rails_helper"

RSpec.describe "to_read_lists/edit", type: :view do
  before(:each) do
    @to_read_list = assign(:to_read_list, ToReadList.create!(
                                            user: nil,
                                            book: nil
    ))
  end

  it "renders the edit to_read_list form" do
    render

    assert_select "form[action=?][method=?]", to_read_list_path(@to_read_list), "post" do

      assert_select "input[name=?]", "to_read_list[user_id]"

      assert_select "input[name=?]", "to_read_list[book_id]"
    end
  end
end
