class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    admin?
  end
  def update?
    admin?
  end
  def show?
    user.team.organization == record
  end

  private
  def admin?
    user.admin?
  end

  def user_is_owner_or_admin?
    record.contact_email == user.email || user.admin
  end
end
