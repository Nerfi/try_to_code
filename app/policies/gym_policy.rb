class GymPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true

  end

  def create?
    return new?

  end

  def show?
    return true

  end
end
