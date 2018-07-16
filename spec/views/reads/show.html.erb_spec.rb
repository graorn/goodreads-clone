require 'rails_helper'

RSpec.describe "reads/show", type: :view do
  before(:each) do
    @read = assign(:read, Read.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
