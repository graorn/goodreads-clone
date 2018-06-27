require "ffaker"

User.create(
  name: "test",
  email: "test@mail.com",
  password: 123_123,
  image: FFaker::Avatar.image
)

User.create(
  name: "test2",
  email: "test2@mail.com",
  password: 123_123,
  image: FFaker::Avatar.image

)

Admin.create!(
  email: "admin@mail.com",
  password: 123_123,
  image: FFaker::Avatar.image

)

20.times do
  Book.create(
    title: FFaker::Book.title,
    author: FFaker::Book.author,
    cover: FFaker::Book.orly_cover,
    genre: FFaker::Book.genre,
    description: FFaker::Book.description,
    created_at: 7.days.ago,
    updated_at: 2.days.ago,
  )
end

20.times do
  UserBook.create(
    user_id: rand(1..2),
    book_id: rand(1..20),
    to_read: FFaker::Boolean.maybe,
    favorite: FFaker::Boolean.random,
    review: FFaker::BaconIpsum.paragraphs,
    rating: rand(1..5),

    )
end
