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

class ReadingList < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_uniqueness_of :book, scope: :user
end
