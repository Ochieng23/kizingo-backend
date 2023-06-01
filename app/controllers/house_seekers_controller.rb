class HouseSeekersController < ApplicationController
    before_action :authenticate_user
  
    def create
        user = User.find_by(user_code: params[:user_code])
      
        if user
          house_seeker = HouseSeeker.new(house_seeker_code: generate_code(12), avatar: params[:avatar], location: params[:location], profession: params[:profession])
          house_seeker.user = user
      
          if house_seeker.save
            render json: house_seeker, status: :created
          else
            render json: { errors: house_seeker.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { errors: ["User not found"] }, status: :not_found
        end
      end
      
      
    def index
      house_seekers = HouseSeeker.all
      render json: house_seekers, status: :ok
    end
  
    def show
      house_seeker = find_house_seeker
      render json: house_seeker, status: :ok
    end
  
    def update
      house_seeker = find_house_seeker
      house_seeker.update!(house_seeker_params)
      render json: house_seeker, status: :ok
    end
  
    def destroy
      house_seeker = find_house_seeker
      house_seeker.destroy
      head :no_content
    end
  
    private
  
    def find_house_seeker
      HouseSeeker.find(params[:id])
    end
  
    def house_seeker_params
      params.permit(:avatar, :location, :profession)
    end
  end
  