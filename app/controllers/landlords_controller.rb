class LandlordsController < ApplicationController
before_action :set_landlord, only: [:show, :destroy]

  # GET /landlords
  def index
    @landlords = Landlord.all
    render json: @landlords
  end

  # GET landlords/1
  def show
    render json: @landlord
  end

  def create
    @landlord = Landlord.new(landlord_params)
    if @landlord.save
      LandlordMailer.welcome_email(@landlord).deliver_now
    end
    #   render json: {landlord: @landlord, jwt: issue_token(@landlord.id)}, status: :created, landlord: @landlord
    # else
    #   render json: @landlord.errors, status: :unprocessable_entity
    # end
  end

  def update
    @landlord = Landlord.find(params[:id])
    @landlord.update(landlord_params)
    if @landlord.save
      LandlordMailer.message_tenant(@landlord).deliver_now
    end
    #   render json: @landlord
    # else
    #   render json: @landlord.errors, status: :unprocessable_entity
    # end
  end



  def destroy
    @landlord.destroy
  end

  private
  def set_landlord
    @landlord = Landlord.find(params[:id])
  end

  def landlord_params
    params.require(:landlord).permit(:name, :email, :phone, :password, :avatar, :message, :message_email)
  end

end
