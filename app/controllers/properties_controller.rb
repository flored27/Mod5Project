class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update, :destroy]

  # GET /properties
  def index
    @property = Property.all
    render json: @property
  end

  # GET properties/1
  def show
    @all={Property: @property, Tenant: @property.tenants, Apartment: @property.apartments}
    render json: @all
  end

  # POST /property
  def create

    @property = Property.new(property_params)
    @property.landlord_id = current_user.id
    @property.save
    propsid = @property.id

    apartments = params[:apartments]
    @apartment_list = apartments.each do |a|
      apart = Apartment.create(number: a[:number], property_id: propsid, landlord_id: current_user.id)
      apart.save
    end
    tenants = params[:tenants]
    @tenant_list = tenants.each do |t|
      apart = Apartment.find_by( property_id: @property.id, number: t[:apartment_number] )
      aID = apart[:id]
      tenant = Tenant.create(name: t[:name], age: t[:age], phone: t[:phone], email: t[:email], apartment_id: aID, apartment_number: t[:apartment_number], property_id: propsid, landlord_id: current_user.id )
      tenant.save

    end

    if @property.save

       @all={Property: @property, Tenants: @property.tenants, Apartments: @property.apartments}
      render json: @all,status: :created, property: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update

    @property = Property.find(params[:property][:id])
    @property.update(property_params)
    apartments = params[:apartment]
    @apartment_list = apartments.each do |a|
      if a[:id] === nil
        apart = Apartment.create(number: a[:number], property_id: a[:property_id])
        apart.save
      else
        apart = Apartment.find(id=a[:id])
        apart.update(number: a[:number])
      end
    end
    tenants = params[:tenant]
    @tenant_list = tenants.each do |t|
      apart = Apartment.find_by( property_id: @property.id, number: t[:apartment_number] )
      aID = apart[:id]
      if t[:id] === nil

        tenant = Tenant.create(name: t[:name], age: t[:age], phone: t[:phone], email: t[:email], apartment_id: aID, apartment_number: t[:apartment_number] )
        tenant.save
      else
        tenant = Tenant.find(id=t[:id])
        tenant.update(name: t[:name], age: t[:age], phone: t[:phone], email: t[:email], apartment_id: aID, apartment_number: t[:apartment_number] )
      end
    end
    if @property.save
      @all={Property: @property, Tenants: @property.landlord.tenants, Apartments: @property.landlord.apartments}
      render json: @all
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def destroy
    userID = @property.landlord_id
    @property.destroy
    @property_list = Property.where(landlord_id:userID)
    @apartment_list = Apartment.where(landlord_id:userID)
    @tenant_list = Tenant.where(landlord_id:userID)
    @all={Property: @property_list, Tenants: @tenant_list, Apartments: @apartment_list}
    render json: @all
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :taxes, :mortgage, :zip, :state, :street_address, :city, :avatar)
  end

  def apartment_params
    params.require(:apartment).permit(:number, :avatar)
  end

  def tenant_params
    params.require(:tenant).permit(:name, :age, :phone, :email, :avatar)
  end


end
