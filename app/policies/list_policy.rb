class ListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      scope.where(user: user).order(:title)
    end
  end

  def show?
    true
  end

  def update?
    true
  end

  def create?
    true
  end

  def destroy?
    # record.user == user
    true
  end

  def done?
    # record.user == user
    true
  end

  def undone?
    # record.user == user
    true
  end

end
