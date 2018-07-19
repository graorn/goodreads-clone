# frozen_string_literal: true

require 'ffaker'

User.create!(
  name: 'test',
  email: 'test@mail.com',
  password: 123_123,
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
    author: FFaker::Book.unique.author,
    cover: FFaker::Book.orly_cover,
    genre: FFaker::Book.genre,
    description: FFaker::Book.description,
    created_at: 7.days.ago,
    updated_at: 2.days.ago,
  )
end

10.times do
  Review.create!(
    reviewer_type: 'User',
    reviewer_id: 1,
    reviewable_type: 'Book',
    reviewable_id: rand(1..2),
    rating: rand(1..5),
    body: FFaker::BaconIpsum.paragraphs,
    title: FFaker::BaconIpsum.phrase
  )
end

10.times do
  Favorite.create!(
    favoritor_type: 'User',
    favoritor_id: 1,
    favoritable_type: 'Book',
    favoritable_id: rand(1..5),
  )
end
AdminUser.create!(email: 'test@mail.com', password: 123123, password_confirmation: 123123) if Rails.env.development?
