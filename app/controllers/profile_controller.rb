class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_books = Book.joins(:favorite_books)
  end
end
