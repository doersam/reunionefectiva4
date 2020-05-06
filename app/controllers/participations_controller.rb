class ParticipationsController < ApplicationController
  before_action :set_team, only:[:new, :create]
  before_action :set_organization, only:[:new, :create]

  def new
    @participation = Participation.new()
    @participation.team = @team #for pundit
    authorize @participation
  end
  def create
    @participation = Participation.new()

    if @participation.user = User.find_by(email: params[:participation][:user])
    @participation.team  = @team
    @participation.save
    authorize @participation
    redirect_to organization_team_path(@organization, @team), notice: 'Incluido exitosamente'
    else
      authorize @participation
     redirect_to organization_team_path(@organization, @team), notice: 'El usuario aun no ha credo una cuenta, no puede ser agregado hasta no estar registrado en el sistema'
    end

  end

  def destroy
    authorize @participation
    @participation = Participation.find(params[:id])
    @participation.destroy
    redirect_to organization_team_path(@organization, @team), notice: 'Eliminado exitosamnte'
  end

  private


  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
end
