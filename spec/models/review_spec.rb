# frozen_string_literal: true

require "rails_helper"

RSpec.describe Review, type: :model do


  it { should validate_presence_of :body }
  it { should validate_presence_of :user }
  it { should validate_presence_of :book }

  it { should belong_to :book }
  it { should belong_to :user }

end
