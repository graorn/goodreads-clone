# == Schema Information
#
# Table name: favorite_books
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  book_id    :integer
#  favorite   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :favorite_book do
    belongs_to ""
    belongs_to ""
    favorite false
  end
end
