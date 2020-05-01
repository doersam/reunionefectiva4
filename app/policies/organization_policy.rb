class OrganizationPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(teams: user.teams)
      end
    end
  end



  def show?
    user.teams.where(organization: record).present?
  end

  def create?
    user.admin?
  end

  def update?

    record.contact_email == user.email || user.admin
  end

  def new_team?

    record.contact_email == user.email || user.admin
  end

  def create_team?
    record.contact_email == user.email || user.admin
  end
end

