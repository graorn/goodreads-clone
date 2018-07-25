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

require 'ffaker'

FactoryBot.define do
  factory :book do
    title { FFaker::Book.unique.title }
    author { FFaker::Book.unique.author }
  end
end
