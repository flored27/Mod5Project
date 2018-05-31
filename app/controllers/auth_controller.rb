class AuthController < ApplicationController
  def create
    user = Landlord.find_by(email: params[:email])
    if user && user.authenticate(params[:password])

      render json: {
        id: user.id,
        email: user.email,
        jwt: issue_token(user.id),
        properties: user.properties,
        name: user.name,
        phone: user.phone,
        tenants: user.tenants,
        apartments: user.apartments,
        status: 200
      }
    else
      render json: {error: "Landlord not found!"}, status: 404
    end
  end

  def show
    if current_user
      render json: {
        id: current_user.id,
        email: current_user.email,
        name: current_user.name,
        properties: current_user.properties,
        tenants: current_user.tenants,
        apartments: current_user.apartments,
        phone: current_user.phone
      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end

  def find
    user = Landlord.find_by(email: params[:email])
    if user
      render json: {
        error: "Landlord aleady exists!",
        message: "Landlord already exists!"
      }
    else
      render json: {
        error: "All good! Landlord email is not in database.",
        message: "All good! Landlord email is not in database."
        }
    end
  end

  def message
    @landlord = Landlord.find(params[:id])
    @message = params[:message]
    @message_email = params[:message_email]
    LandlordMailer.message_tenant(@message, @message_email, @landlord).deliver_now
  end
end
