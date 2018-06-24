# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_books = current_user.books.distinct
  end
end
