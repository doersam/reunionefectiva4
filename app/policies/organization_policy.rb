class OrganizationPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        raise
        scope.where(user.participation.team.organization)
      end
    end
  end

  def create?
    admin?
  end
  def update?
    admin?
  end
  def show?
    true
  end

  private
  def admin?
    user.admin?
  end

  def user_is_contact_or_admin?
    record.contact_email == user.email || user.admin
  end
end

