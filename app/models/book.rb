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
#  rating      :integer
#  review      :text
#  to_read     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  cover       :string

class Book < ApplicationRecord
  has_many :reviews

  validates_presence_of :title
  validates_presence_of :author
end
