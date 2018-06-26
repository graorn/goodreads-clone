
require "ffaker"

User.create(
  name: "test",
  email: "test@mail.com",
  password: 123_123
)

User.create(
  name: "test2",
  email: "test2@mail.com",
  password: 123_123
)

User.create(
    name: "admin",
    email: "admin@mail.com",
    password: 123_123
)

20.times do
  Book.create(
    title: FFaker::Book.title,
    author: FFaker::Book.author,
    cover: FFaker::Book.orly_cover,
    genre: FFaker::Book.genre,
    description: FFaker::Book.description,
    rating: rand(1..5),
    to_read: FFaker::Boolean.maybe,
    created_at: 7.days.ago,
    updated_at: 2.days.ago,
    user_id: 1
  )
end

FavoriteBook.create(
  user_id: 1,
  book_id: 1
)

FavoriteBook.create(
  user_id: 1,
  book_id: 2
)
