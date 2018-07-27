# frozen_string_literal: true

class ReviewPolicy < ApplicationPolicy
  def show?
    user
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    record.user
  end

  def update?
    record.user
  end

  def destroy?
    user.admin?
  end
end
