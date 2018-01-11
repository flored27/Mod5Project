class LandlordsController < ApplicationController
before_action :set_landlord, only: [:show, :update, :destroy]

  # GET /landlords
  def index
    @landlords = Landlord.all
    render json: @landlords
  end

  # GET landlords/1
  def show
    render json: @landlord
  end

  # POST /landlord
  def create
    @landlord = Landlord.new(landlord_params)
    if @landlord.save
      render json: @landlord,status: :created, landlord: @landlord
    else
      render json: @landlord.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /landlords/1
  def update
    @landlord = Landlord.find(params[:id])
    @landlord.update(landlord_params)
    if @landlord.save
      render json: @landlord
    else
      render json: @landlord.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @landlord.destroy
  end

  private
  def set_landlord
    @landlord = Landlord.find(params[:id])
  end

  def landlord_params
    params.require(:landlord).permit(:name, :email, :phone)
  end

end
