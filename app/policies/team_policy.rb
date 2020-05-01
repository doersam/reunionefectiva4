class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      raise
      scope.all
    end
  end


  def create?
    true
  end

  def update?
    true
  end

  def show?
    true
  end

  def destroy?
    admin?
  end

  private

  # def organization
  #   record.organization
  # end

  def admin?
    user.admin
  end

  # def is_contact_or_admin?
  #   record.organization.contact_email == user.email || admin?
  # end


end
