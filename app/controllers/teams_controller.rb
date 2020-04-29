class TeamsController < ApplicationController

  def index
    @teams = Team.all

  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
    @organizations = Organization.all
  end

  def create
    @team = Team.new()
    @team.organization = Organization.find(team_params[:organization])
    @team.name = team_params[:name]
    @team.description = team_params[:description]
    @team.save
    redirect_to team_path(@team)
  end

  def edit
    @team = Team.find(params[:id])
    @organizations = Organization.all
  end

  def update
    @team = Team.find(params[:id])
    @team.organization = Organization.find(team_params[:organization])
    @team.name = team_params[:name]
    @team.description = team_params[:description]
    @team.save
    redirect_to team_path(@team)
  end

  def destroy

  end

  private
  def team_params
    params.require(:team).permit(:name, :description, :organization)

  end

end

