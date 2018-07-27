# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomePolicy do
  let!(:user) { build :user }

  subject { described_class }

  permissions :index? do
    it 'lets everyone access to home page' do
      expect(subject).to permit(user), :home
    end
  end
end
