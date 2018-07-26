# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReadingList, type: :model do
  let!(:book) { build :book }
  let!(:user) { build :user }


  it { should belong_to :user }
  it { should belong_to :book }

  it { should validate_uniqueness_of(:book).scoped_to(:user) }
end
