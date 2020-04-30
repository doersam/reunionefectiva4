class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user_in_organization_or_admin?
  end

  def create?
    user_in_organization_or_admin?
  end

  def update?
    organization.contact_email == user.email
  end

  def show?
    user_in_organization_or_admin?
  end

  private
  def organization
    record.organization
  end

  def admin?
    user.admin
  end

  def user_in_organization_or_admin?
    organization == user.team.organization || user.admin
  end

end
