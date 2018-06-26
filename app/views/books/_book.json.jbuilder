# frozen_string_literal: true

json.extract! book, :id, :title, :author, :genre, :description,
:rating, :review, :favorite, :to_read, :created_at, :updated_at
json.url book_url(book, format: :json)
