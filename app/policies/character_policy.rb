class CharacterPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user
  end

  def update?
    user.nil? ? false : (user.admin? || record.user == user)
  end

  def destroy?
    user.nil? ? false : (user.admin? || record.user == user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
