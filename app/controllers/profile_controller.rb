# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_books = favorite_books
    @to_read_books = to_read_books
  end

  private

    def favorite_books
      Book.joins(:user_books).where(user_books: { favorite: true, user: current_user })
    end

    def to_read_books
      Book.joins(:user_books).where(user_books: { to_read: true, user: current_user })
    end
end
