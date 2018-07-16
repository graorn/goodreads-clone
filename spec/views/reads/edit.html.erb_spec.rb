require 'rails_helper'

RSpec.describe "reads/edit", type: :view do
  before(:each) do
    @read = assign(:read, Read.create!())
  end

  it "renders the edit read form" do
    render

    assert_select "form[action=?][method=?]", read_path(@read), "post" do
    end
  end
end
