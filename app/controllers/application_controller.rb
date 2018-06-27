# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def favorite_text
    @favorite_exists ? "Unfavorite" : "Favorite"
  end


  def to_read_text
    @to_read_lists_exist ? "Remove from read list" : "Add to read list"
  end



  helper_method :favorite_text
end
