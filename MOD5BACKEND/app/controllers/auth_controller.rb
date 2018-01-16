class AuthController < ApplicationController
  def create
    user = Landlord.find_by(email: params[:email])
    if user && user.authenticate(params[:password])

      render json: {
        id: user.id,
        email: user.email,
        jwt: issue_token(user.id),
        properties: user.properties,
        status: 200
      }
    else
      render json: {error: 'Landlord not found!'}, status: 404
    end
  end

  def show
    if current_user
      render json: {
        id: current_user.id,
        email: current_user.email,
        properties: current_user.properties
      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end
end
