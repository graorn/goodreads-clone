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
#

require 'ffaker'

FactoryBot.define do
  factory :book do
    title FFaker::Book.title
    author FFaker::Book.author
    genre FFaker::Book.genre
    cover FFaker::Book.cover
    description FFaker::Book.description
    rating 1..5
    review FFaker::BaconIpsum.paragraphs
    favorite FFaker::Boolean.random
    to_read FFaker::Boolean.maybe
    created_at 7.days.ago
    updated_at 2.days.ago
    user
  end
end
