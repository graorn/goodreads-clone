# frozen_string_literal: true

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
  end
end
