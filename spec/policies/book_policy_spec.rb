# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookPolicy do
  let(:user) { build_stubbed :user }
  let(:admin) { build_stubbed :user, admin: true }

  subject { described_class }

  permissions :update?, :edit? do
    it 'denies access to users' do
      expect(subject).to_not permit(user, Book.new)
    end
  end
end
