# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :author }

  it { should have_many :reading_lists }
  it { should have_many :favorites }
  it { should have_many :reviews }
end
