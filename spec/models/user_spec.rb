# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { build :user }

  let!(:read) { build :reading_list }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is invalid without email' do
    user.email = nil
    expect(user).to be_invalid
  end

  it 'is valid with valid email' do
    user.email = 'invalid email'
    expect(user).to be_invalid
  end

  it 'is invalid without password' do
    user.password = nil
    expect(user).to be_invalid
  end


  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of :password }

  it { should have_many :reading_lists }
  it { should have_many :favorites }
  it { should have_many :reviews }
end
