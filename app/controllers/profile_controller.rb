# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_books = current_user.books.merge(UserBook.where(favorite: true))
    @to_read_books = current_user.books.merge(UserBook.where(to_read: true))

  end

  def favorite_books
    user.books
  end
end
