# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReadingList, type: :model do
  it { should belong_to :user }
  it { should belong_to :book }
end
