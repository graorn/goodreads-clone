# frozen_string_literal: true

# == Schema Information
#
# Table name: to_read_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :to_read_list do
    user nil
    book nil
  end
end
