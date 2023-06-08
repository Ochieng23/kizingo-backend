class AuthController < ApplicationController
  skip_before_action :authenticate_user

  # Log in action => Generates access token
  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Generate token
      token = generate_token(user)
      render json: { accessToken: token }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  # Generate JWT token
  def generate_token(user)
    # Set expiration time to 1 hour from now
    expiration = 1.hour.from_now.to_i
  
    # Assign a default role if the user role is not present or invalid
    role = user.role || "house_seeker"
  
    # Encode user role and reference in token
    payload = {
      role: role,
      user_ref: user.user_code,
      exp: expiration
    }
  
    # Generate token using JWT gem
    secret_key = Rails.application.credentials.secret_key_base || Rails.application.secrets.secret_key_base
    JWT.encode(payload, secret_key)
  end
  
end
