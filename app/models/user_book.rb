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

class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
