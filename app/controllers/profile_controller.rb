# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorited_books = Favorite.all.where(user: current_user)
    @books_to_read = ReadingList.all.where(user: current_user)
  end
end
