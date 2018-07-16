require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    create :user
  end

  let!(:read) do
    create :read
  end

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


  it {should validate_presence_of :email}
  it {should validate_uniqueness_of(:email).case_insensitive}
  it {should validate_presence_of :password}


  it {should have_many :reads }



end
