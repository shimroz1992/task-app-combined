class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only: :create
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      sign_in(user)
      render json: user
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # ... rest of the controller
end
