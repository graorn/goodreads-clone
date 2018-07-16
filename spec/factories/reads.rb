# == Schema Information
#
# Table name: reads
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'ffaker'

FactoryBot.define do
  factory :read do
    user
    book
  end
end
