class InvitationsController < ApplicationController
  before_action :find_organization
  before_action :find_team
  before_action :find_meeting
  skip_before_action :find_organization, only:[:destroy]
  skip_before_action :find_team, only:[:destroy]
  skip_before_action :find_meeting, only:[:destroy]

  def invite_someone
    @invitation = Invitation.new
   @invitation.meeting = @meeting #for pundit do not delete
    authorize @invitation
  end

  def new
    @invitation = Invitation.new(meeting: @meeting)
    @team.users.each do |user|
      invitation =Invitation.new(user: user, meeting: @meeting)
      invitation.save
    end
    authorize @invitation

  end

  def create
    @user = User.find(invitation_params[:user_id])
    @invitation = Invitation.new(meeting: @meeting, user: @user)
    authorize @invitation
    if  @invitation.save
      redirect_to edit_organization_team_meeting_invitation_path(@organization, @team, @meeting, @invitation), notice: 'El invitado fue agregado'
    else
      redirect_to edit_organization_team_meeting_invitation_path(@organization, @team, @meeting, @invitation), notice: 'El invitado no pudo ser agregado'

    end
  end

  def edit
    @invitation = @meeting.invitations.first
    authorize @invitation
  end
  def update

  end
  def send_invites

  end

  def destroy
    @invitation = Invitation.find(params[:id])
    authorize @invitation
    @invitation.destroy!
    redirect_to edit_organization_team_meeting_invitation_path(@invitation.meeting.organization, @invitation.meeting.team, @invitation.meeting), notice: 'El invitado fue eliminado'
  end

  private
  def invitation_params
    params.require(:invitation).permit(:user_id)
  end
  def find_organization
    @organization = Organization.find(params[:organization_id])
  end
  def find_team
    @team = Team.find(params[:team_id])
  end
  def find_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end
end
