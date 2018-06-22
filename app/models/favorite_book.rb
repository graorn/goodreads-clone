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

class FavoriteBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
