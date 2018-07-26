# frozen_string_literal: true

# == Schema Information
#
# Table name: reading_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :reading_list do
  end
end
