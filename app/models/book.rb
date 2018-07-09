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
#  to_read     :boolean
#  cover       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Book < ApplicationRecord
  acts_as_favoritable

  has_many :reviews, as: :reviewable
  has_many :reviewers, as: :reviewer

  has_many :reads
  has_many :users, through: :reads


  validates_presence_of :title
  validates_presence_of :author
end
