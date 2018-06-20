# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'


10.times do
    User.create(
        name: FFaker::Name.name,
        email: FFaker::Internet.free_email,
        password: FFaker::Internet.password,
        confirmed_at: Time.now
    )
end

20.times do
    Book.create(
        title: FFaker::Book.title,
        author: FFaker::Book.author,
        genre: FFaker::Book.genre,
        description: FFaker::Book.description,
        rating: 1..5,
        review: FFaker::BaconIpsum.paragraphs,
        favorite: FFaker::Boolean.random,
        to_read: FFaker::Boolean.maybe,
        created_at: 7.days.ago,
        updated_at: 2.days.ago,
        user_id: 1
    )
end
