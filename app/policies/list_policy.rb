class ListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user).order(:id)
    end
  end

  def show?
    record.user == user
  end

  def update?
    record.user == user
  end

  def create?
    # record.user == user
    true
  end

  def destroy?
    record.user == user
  end

  def done?
    record.user == user
  end

  def undone?
    record.user == user
  end
end
