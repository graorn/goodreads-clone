# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def favorite_text
    @favorite_exists ? "Unfavorite" : "Favorite"
  end

  helper_method :favorite_text
end
