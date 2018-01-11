class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :update, :destroy]

  # GET /tenants
  def index
    @tenants = Tenant.all
    render json: @tenants
  end

  # GET tenants/1
  def show
    render json: @tenant
  end

  # POST /tenant
  def create
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      render json: @tenant,status: :created, tenant: @tenant
    else
      render json: @tenant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tenants/1
  def update
    @tenant = Tenant.find(params[:id])
    @tenant.update(tenant_params)
    if @tenant.save
      render json: @tenant
    else
      render json: @tenant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tenant.destroy
  end

  private
  def set_tenant
    @tenant = Tenant.find(params[:id])
  end

  def tenant_params
    params.require(:tenant).permit(:number, :tenant_id, :property_id)
  end

end
