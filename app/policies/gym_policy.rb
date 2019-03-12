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

  def update?
  #return true
    record.user == user

  end

  def destroy?
    user_is_owner?
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.

  end

  private

  def user_is_owner?
        record.user == user

  end
end
