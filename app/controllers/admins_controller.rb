class AdminsController < ApplicationController
    def create
      user = User.find_by(user_code: params[:user_code])
  
      if user
        admin = Admin.new(admin_code: generate_code(12), avatar: params[:avatar], full_name: params[:full_name], user_code: params[:user_code])
       admin.user = user
        if admin.save
          render json: admin, status: :created
        else
          render json: { errors: admin.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { errors: ["User not found"] }, status: :not_found
      end
    end
  
    def index
      admins = Admin.all
      render json: admins, status: :ok
    end
  
    def show
      admin = find_admin
      render json: admin, status: :ok
    end
  
    def update
      admin = find_admin
      admin.update!(admin_params)
      render json: admin, status: :ok
    end
  
    def destroy
      admin = find_admin
      admin.destroy
      head :no_content
    end
  
    private
  
    def find_admin
      Admin.find(params[:id])
    end
  
    def admin_params
      params.permit(:avatar, :user_code, :full_name)
    end
  end
  