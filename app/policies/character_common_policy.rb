class CharacterCommonPolicy < ApplicationPolicy
  def update?
    user.nil? ? false : (user.admin? || record.character.user == user)
  end

  def destroy?
    user.nil? ? false : (user.admin? || record.character.user == user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
