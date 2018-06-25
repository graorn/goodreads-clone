# == Schema Information
#
# Table name: favorite_books
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :favorite_book do
    user nil
    book nil
  end
end