# frozen_string_literal: true

require "rails_helper"

RSpec.describe Book, type: :model do
  let(:user) { User.new }
  let(:review) { Review.new }

  subject do
    described_class.new title: "Test Title", author: "Test author"
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without author" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should have_many(:reviews) }
  end
end
