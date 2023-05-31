# frozen_string_literal: true

class ApplicationController < ActionController::API
    before_action :authenticate_user
    # skip_before_action :verify_authenticity_token

    # show error message when trying to use invalid parameters to create entity
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_params
    # show error message when requested resouce is not found
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
     # this method is called to generate id for tables, encoded as strings
     def generate_code(length)
        # characters allowed in the varchar string
        chars = ('a'..'z').to_a + ('0'..'9').to_a
      
        # Generate a random string of the desired length
        random_string = (0...length).map { chars[rand(chars.length)] }.join
      
        # Insert hyphens after every 3 characters
        random_string.insert(4, '-').insert(9, '-')
    end

    
    # Authenticate user with JWT
    def authenticate_user
        # Get token from request headers
        header = request.headers['Authorization']
        token = header.split(' ').last if header
        
        if token
          begin
            # Decode token using JWT gem
            decoded_token = JWT.decode(token, Rails.application.secret_key_base)
            # Verify expiration time
            if decoded_token[0]['exp'] < Time.now.to_i
              render json: { error: 'Token has expired' }, status: :unauthorized
            else
              # Access user role and reference from token
              user_role = decoded_token[0]['role']
              user_reference = decoded_token[0]['user_ref']

              @current_user = User.find_by(user_code: user_reference)

              # Check if user exists
                unless @current_user
                    render json: {error: 'Unauthorized'}, status: :unauthorized
                end
            end
          rescue JWT::DecodeError
            render json: { error: 'Invalid token' }, status: :unauthorized
          end
        else
          render json: { error: 'Token not provided' }, status: 403
        end
    end 
    private

    def invalid_params(invalid)
        render json: { errors: [invalid.record.errors] }, status: :unprocessable_entity
    end

    def render_not_found(invalid)
        render json: { errors: [invalid.exception] }, status: :not_found
    end
end
