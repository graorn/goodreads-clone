# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorited_books = current_user.all_favorited
    @books_to_read = ReadingList.all.where(user: current_user)
  end

end
