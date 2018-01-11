class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update, :destroy]

  # GET /properties
  def index
    @properties = Property.all
    render json: @properties
  end

  # GET properties/1
  def show
    render json: @property
  end

  # POST /property
  def create
    @property = Property.new(property_params)
    if @property.save
      render json: @property,status: :created, property: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    if @property.save
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:taxes, :mortgage, :location, :state, :county, :city, :landlord_id)
  end

end
