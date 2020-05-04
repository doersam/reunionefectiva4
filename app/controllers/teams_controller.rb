class TeamsController < ApplicationController
  before_action :find_organization


  def show
    @team = Team.find(params[:id])
    authorize @team
  end


  def new
    @team = Team.new()
    @team.organization = @organization
    authorize @team
  end

  def create
    @team = Team.new(team_params)
    @team.organization = @organization
    if  @team.save
      redirect_to organization_team_path(@organization, @team), notice: 'el Equipo fue creado'
    else
      render :new
    end

    authorize @team

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
    redirect_to organization_team_path(@organization, @team), notice: 'el Equipo fue editado'
  end




  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to organization_path(@organization)
  end

  private
  def team_params
    params.require(:team).permit(:name, :description)

  end
  def find_organization
    @organization = Organization.find(params[:organization_id])
  end

end

