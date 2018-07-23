# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorited_books = current_user.all_favorited
    @readBooks = Book.left_outer_joins(:reads)
  end

end
