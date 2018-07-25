# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  author      :string           not null
#  genre       :string
#  description :string
#  to_read     :boolean
#  cover       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Book < ApplicationRecord
  has_many :reviews
  has_many :reading_lists

  validates_presence_of :title
  validates_presence_of :author
end
