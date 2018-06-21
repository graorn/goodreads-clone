class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @books = current_user.books
  end
end
