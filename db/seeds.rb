# frozen_string_literal: true

require 'ffaker'

User.create!(
  name: 'test',
  email: 'test@mail.com',
  password: 123_123,
  admin: true,
  image: FFaker::Avatar.image
)

User.create!(
  name: 'test2',
  email: 'test2@mail.com',
  password: 123_123,
  image: FFaker::Avatar.image
)

20.times do
  Book.create!(
    title: FFaker::Book.unique.title,
    author: FFaker::Book.author,
    cover: FFaker::Book.unique.orly_cover,
    genre: FFaker::Book.genre,
    description: FFaker::Book.description,
    created_at: 7.days.ago,
    updated_at: 2.days.ago,
  )
end

10.times do
  Review.create!(
    user_id: 1,
    book_id: 1,
    rating: rand(1..5),
    content: FFaker::BaconIpsum.paragraphs,
    title: FFaker::BaconIpsum.phrase
  )
end

AdminUser.create!(email: 'test@mail.com', password: 123123, password_confirmation: 123123) if Rails.env.development?
