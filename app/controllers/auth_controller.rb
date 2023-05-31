class AuthController < ApplicationController
    skip_before_action :authenticate_user
    # Log in action=> Generates access token
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
      expiration = Time.now.to_i + 24.hour.to_i

      # Encode user role and reference in token
      payload = {
        role: user.role,
        user_ref: user.user_code,
        exp: expiration
      }

      # Generate token using JWT gem
      JWT.encode(payload, Rails.application.secret_key_base)
    end
end