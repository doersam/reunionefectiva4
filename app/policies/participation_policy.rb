class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    in_organization_or_admin?
  end
  def destroy?
    user.admin?
  end

  private
  def in_organization_or_admin?
    user.teams.where(organization: record.team.organization).present? || admin?
  end
end
