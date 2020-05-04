class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def create?
     is_part_of_organization_or_admin?
  end

  def update?
    is_contact_or_admin?
  end

  def show?
    is_part_of_organization_or_admin?
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

  def is_part_of_organization_or_admin?
    user.teams.where(organization: record.organization).present? || admin?
  end


end
