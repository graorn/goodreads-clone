# frozen_string_literal: true

# == Schema Information
#
# Table name: user_books
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  book_id    :integer          not null
#  review     :text
#  favorite   :boolean
#  rating     :integer
#  to_read    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :user_book do
    user nil
    book nil
    review "MyText"
    favorite false
    rating 1
    to_read false
  end
end
