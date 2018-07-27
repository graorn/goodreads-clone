# frozen_string_literal: true

class BookPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def delete?
    user.admin?
  end

  def favorite?
    user || record.user = user
  end

  def unfavorite?
    user || record.user = user
  end

  def place_book_to_reading_list?
    user || record.user = user
  end

  def remove_from_reading_list?
    user || record.user = user
  end
end
