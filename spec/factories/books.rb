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
#  favorite    :boolean
#  to_read     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

FactoryBot.define do
  factory :book do
    title 'MyString'
    author 'MyString'
    genre 'MyString'
    description 'MyString'
    rating 1
    review 'MyText'
    favorite false
    to_read false
    user_id 1
  end
end
