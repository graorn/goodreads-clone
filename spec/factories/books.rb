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

require "ffaker"

FactoryBot.define do
  factory :book do
    title FFaker::Book.title
    author FFaker::Book.author
    genre FFaker::Book.genre
    cover FFaker::Book.cover
    description FFaker::Book.description
    rating 1..5
    favorite FFaker::Boolean.random
    to_read FFaker::Boolean.maybe
    created_at 7.days.ago
    updated_at 2.days.ago
    user
  end
end
