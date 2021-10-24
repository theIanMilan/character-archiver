class CharacterCommonPolicy < ApplicationPolicy
  # In views, policy checking fails when User has no existing data for the record
  # Opt instead to check Character policy in Views
  # When accessing through routes, policy works as intended.

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
