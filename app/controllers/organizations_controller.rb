class OrganizationsController < ApplicationController
  before_action :set_organization, only:[:show, :edit, :update]
  def index
    @organizations = policy_scope(Organization)
  end

  def show
    authorize @organization
  end

  def new
    @organization = Organization.new
    authorize @organization
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to organization_path(@organization), notice: 'La Organización fue creada'
    else
      render :new
    end
    authorize @organization
  end

  def edit
    authorize @organization
  end

  def update
    @organization.update(organization_params)
    redirect_to organization_path(@organization)
    authorize @organization
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :legal_id, :contact_email)

  end
  def set_organization
    @organization =Organization.find(params[:id])
  end

end
