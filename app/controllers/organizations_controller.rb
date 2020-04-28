class OrganizationsController < ApplicationController
  #before_action :method, only:[:index, :show]
  def index
    @organizations = Organization.all

  end

  def show
    @organization = Organization.find(params[:id])
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.save
    redirect_to organization_path(@organization)
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    @organization.update(organization_params)
    redirect_to organization_path(@organization)
  end

  def destroy

  end

  private
  def organization_params
    params.require(:organization).permit(:name, :legal_id, :contact_email)

  end

end
