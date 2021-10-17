class ProfilePolicy < ApplicationPolicy
  def user_characters?
    true
  end

  def show?
    true
  end

  def update?
    user.nil? ? false : (user.admin? || record.user == user)
  end
end
