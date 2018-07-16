require 'rails_helper'

RSpec.describe "reads/index", type: :view do
  before(:each) do
    assign(:reads, [
      Read.create!(),
      Read.create!()
    ])
  end

  it "renders a list of reads" do
    render
  end
end
