require 'rails_helper'

RSpec.describe "reads/new", type: :view do
  before(:each) do
    assign(:read, Read.new())
  end

  it "renders new read form" do
    render

    assert_select "form[action=?][method=?]", reads_path, "post" do
    end
  end
end
