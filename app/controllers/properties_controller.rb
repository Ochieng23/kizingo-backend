class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show update destroy ]
  before_action :authenticate_user, only: [:create, :update, :destroy]

  # GET /properties
  def index
    @properties = Property.all

    render json: @properties
  end

  # GET /properties/1
  def show
    render json: @property
  end

  # POST /properties
  def create
    @property = Property.new(property_params)
  
    # Other code to retrieve and validate property parameters
  
    # Upload images and get the image URLs
    image_urls = params[:property][:media] || []
  
    # Assign the image URLs to the property's media property
    @property.media = image_urls
  
    if @property.save
      render json: @property, status: :created
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :location, :description, :listing_type, :sqft, :price, media: [])
    end
    
    
    def authenticate_user
      
      header = request.headers['Authorization']
      token = header.split(' ').last if header

      if token
        
        decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base)
        
        if decoded_token[0]['exp'] < Time.now.to_i
          render json: { error: 'Token has expired' }, status: :unauthorized
        else
          
          user_role = decoded_token[0]['role']
          user_reference = decoded_token[0]['user_ref']

          @current_user = User.find_by(user_code: user_reference)

  
          if @current_user.nil? || user_role != 'admin'
            render json: { error: 'Unauthorized' }, status: :unauthorized
          end
        end
      else
        render json: { error: 'Token not provided' }, status: 403
      end
    end
end
