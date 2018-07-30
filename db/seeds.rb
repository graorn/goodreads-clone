# frozen_string_literal: true

require 'ffaker'

User.create!(
  name: 'test',
  email: 'test@mail.com',
  password: 123_123,
  admin: true,
)

User.create!(
  name: 'test2',
  email: 'test2@mail.com',
  password: 123_123,
)

AdminUser.create!(email: 'test@mail.com', password: 123123, password_confirmation: 123123) if Rails.env.development?
