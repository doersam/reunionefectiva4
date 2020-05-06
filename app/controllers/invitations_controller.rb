class InvitationsController < ApplicationController

  def new
    @organization = Organization.find(params[:organization_id])
    @meeting = Meeting.find(params[:meeting_id])
    @team  = Team.find(params[:team_id])
    @invitation = Invitation.new(meeting: @meeting)
    @team.users.each do |user|
      invitation =Invitation.new(user: user, meeting: @meeting)
      invitation.save
    end
    authorize @invitation
    redirect_to organization_team_meeting_path(@organization, @team, @meeting), notice: 'La reunión fue creada'
  end

  def create

  end

  def edit
    @organization = Organization.find(params[:organization_id])
    @meeting = Meeting.find(params[:meeting_id])
    @team  = Team.find(params[:team_id])
    @invitation = @meeting.invitations.first
    authorize @invitation
  end
  def update

  end

  def destroy
     @invitation = Invitation.find(params[:id])
    authorize @invitation
    @invitation.destroy!
    redirect_to edit_organization_team_meeting_invitation_path(@invitation.meeting.organization, @invitation.meeting.team, @invitation.meeting), notice: 'El invitado fue eliminado'
  end

end
