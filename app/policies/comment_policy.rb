class CommentPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    user.nil? ? false : (user.admin? || record.user == user || record.profile.user == user)
  end
end
