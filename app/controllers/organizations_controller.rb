class OrganizationsController < ApplicationController
  #before_action :method, only:[:index, :show]
  def index

    @organizations = policy_scope(Organization)


  end

  def show
    @organization = Organization.find(params[:id])
    authorize @organization
  end

  def new
    @organization = Organization.new
    authorize @organization
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.save
    redirect_to organization_path(@organization)
    authorize @organization
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    @organization.update(organization_params)
    redirect_to organization_path(@organization)
  end


  private
  def organization_params
    params.require(:organization).permit(:name, :legal_id, :contact_email)

  end

end
