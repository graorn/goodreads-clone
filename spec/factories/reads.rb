# == Schema Information
#
# Table name: reads
#
#  id      :integer          not null, primary key
#  user_id :integer          not null
#  book_id :integer          not null
#

require 'ffaker'

FactoryBot.define do
  factory :read do
    user
    book
  end
end
