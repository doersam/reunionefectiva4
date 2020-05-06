class MeetingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    is_in_team_or_admin?
  end

  def create?
    is_in_team_or_admin?
  end

  def update?
    creator_or_admin?
  end

  def destroy?
    creator_or_admin?
  end

  private
  def is_in_team_or_admin?
    record.team.users.where(id: user.id).present? || user.admin?
  end

  def creator_or_admin?
    record.user == user || user.admin?
  end


end
