# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string
#  author      :string
#  genre       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cover       :string
#

class Book < ApplicationRecord
  acts_as_favoritable

  validates_presence_of :title
  validates_presence_of :author
end
