class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      raise
      scope.all
    end
  end


  def create?
    user.teams.where(organization: record.organization).present? || admin?
  end

  def update?
    is_contact_or_admin?

  end

  def show?
    true
  end

  def destroy?
    admin?
  end

  private

  def admin?
    user.admin
  end

  def is_contact_or_admin?
    record.organization.contact_email == user.email || admin?
  end


end
