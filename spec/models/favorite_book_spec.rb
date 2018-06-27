# frozen_string_literal: true

require "rails_helper"

RSpec.describe FavoriteBook, type: :model do
  it { should belong_to :book }
  it { should belong_to :user }
end
