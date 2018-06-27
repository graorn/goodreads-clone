# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many :books }
  it { should have_many :reviews }
  it { should have_many :favorite_books }
end
