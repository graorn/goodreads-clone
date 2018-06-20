# frozen_string_literal: true

class ProfileController < ApplicationController
  def index
    @user = User
  end
end
