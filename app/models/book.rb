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
  has_many :favorite_books
  has_many :users, through: :favorite_books

  has_many :reviews
  has_many :users, through: :reviews

  validates_presence_of :title
  validates_presence_of :author


  def favorite_books
  end
end
