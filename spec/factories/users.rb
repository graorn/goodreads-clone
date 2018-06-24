# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :time
#  provider               :string
#  uid                    :string
#  name                   :string
#  image                  :string
#  favorite_book_id       :integer
#

require 'ffaker'

FactoryBot.define do
  factory :user do
    name FFaker::Name.name
    email FFaker::Internet.free_email
    password FFaker::Internet.password
    confirmed_at Time.now
  end
end
