class SupplierPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(company: user.company)
    end
  end

  def index?
    user
  end

  def create?
    user
  end

  def update?
    user
  end

  def destroy?
    user
  end

  def permitted_attributes
    [:name]
  end
end
