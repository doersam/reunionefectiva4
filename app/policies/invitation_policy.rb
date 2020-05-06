class InvitationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    creator_or_admin?
  end

  def destroy?
    creator_or_admin?
  end

  def edit?
    creator_or_admin?
  end

  def invite_someone?
    creator_or_admin?
  end

  def create?
    creator_or_admin?
  end

  private
  def creator_or_admin?
    record.meeting.user == user || user.admin?
  end
end
