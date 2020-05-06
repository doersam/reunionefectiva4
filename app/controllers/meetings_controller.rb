class MeetingsController < ApplicationController
  before_action :find_organization
  skip_before_action :find_organization, only:[:destroy]
  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
    authorize @meeting
    @user = current_user
    @team = find_team
  end

  def new
    @meeting = Meeting.new
    @meeting.organization = find_organization
    @meeting.team = find_team
    authorize @meeting
  end

  def create
    @meeting  = Meeting.new(meeting_params)
    @meeting.organization = find_organization
    @meeting.team = find_team
    @meeting.user = current_user
    authorize @meeting
    if @meeting.save
      redirect_to new_organization_team_meeting_invitation_path(@organization, @team, @meeting), notice: 'La reunión fue creada'
    else
      render :new
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
    authorize @meeting
  end
  def update
    @meeting = Meeting.find(params[:id])
    @meeting.name = meeting_params[:name]
    authorize @meeting
    if @meeting.save
      redirect_to organization_team_meeting_path(@organization, @team, @meeting), notice: 'La reunión fue creada'
    else
      render :new
    end
  end
  def destroy

    @meeting = Meeting.find(params[:id])
    authorize @meeting
    @meeting.destroy!
    redirect_to organization_team_path(@meeting.organization, @meeting.team), notice: 'La reunión fue eliminada'

  end


  private
  def meeting_params
    params.require(:meeting).permit(:name)
  end

  def find_team
    @team = Team.find(params[:team_id])
  end

  def find_organization
    @organization = Organization.find(params[:organization_id])
  end
end
