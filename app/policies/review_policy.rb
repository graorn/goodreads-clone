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
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end
