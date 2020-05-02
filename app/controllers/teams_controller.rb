class TeamsController < ApplicationController

  def index
    @teams = policy_scope(Team)
  end

  def show
    @team = Team.find(params[:id])
    authorize @team
  end


  def new
    @team = Team.new()
    @organization = Organization.find(params[:format])
    @team.organization = @organization
    authorize @team
  end

  def create
    @team = Team.new(team_params)
    @team.organization = Organization.find(params[:organization])
    @team.save
    authorize @team
    redirect_to team_path(@team)
  end

  def edit
    @team = Team.find(params[:id])
    authorize @team
  end

  def update
    @team = Team.find(params[:id])
    @team.name = team_params[:name]
    @team.description = team_params[:description]
    @team.save
    authorize @team
    redirect_to team_path(@team)
  end




  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to organization_path(@team.organization)
  end

  private
  def team_params
    params.require(:team).permit(:name, :description)

  end

end

