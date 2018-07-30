# frozen_string_literal: true

class ProfilePolicy < ApplicationPolicy
  def index?
    user
  end



  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
