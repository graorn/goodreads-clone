# frozen_string_literal: true

class FavoriteBooksController < ApplicationController
  before_action :authenticate_user!

  def update
    @favorite_book = FavoriteBook.where(book: Book.find(params[:book]), user: current_user)

    if @favorite_book == []
      FavoriteBook.create(book: Book.find(params[:book]), user: current_user)
      @favorite_exists = true
    else
      @favorite_book.destroy_all
    end

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
