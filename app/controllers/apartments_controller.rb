class ApartmentsController < ApplicationController
before_action :set_apartment, only: [:show, :update, :destroy]

# GET /apartments
def index
  @apartments = Apartment.all
  render json: @apartments
end

# GET apartments/1
def show
  render json: @apartment
end

# POST /apartment
def create
  @apartment = Apartment.new(apartment_params)
  if @apartment.save
    render json: @apartment,status: :created, apartment: @apartment
  else
    render json: @apartment.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /apartments/1
def update
  @apartment = Apartment.find(params[:id])
  @apartment.update(apartment_params)
  if @apartment.save
    render json: @apartment
  else
    render json: @apartment.errors, status: :unprocessable_entity
  end
end

def destroy
  @ap = @apartment
  @apartment.destroy
  render json: @ap
end

private
def set_apartment
  @apartment = Apartment.find(params[:id])
end

def apartment_params
  params.require(:apartment).permit(:number, :property_id, :avatar)
end

end
