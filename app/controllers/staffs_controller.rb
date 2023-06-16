class StaffsController < ApplicationController
  before_action :set_property, only: %i[ show update destroy ]
  before_action :authenticate_user, only: [:create, :update, :destroy]

  # GET /staffs
  def index
    @staffs = Staff.all

    render json: @staffs
  end

  # GET /staffs/1
  def show
    render json: @staff
  end

  # POST /staffs
  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      render json: @staff, status: :created, location: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /staffs/1
  def update
    if @staff.update(staff_params)
      render json: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # DELETE /staffs/1
  def destroy
    @staff.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_params
      params.require(:staff).permit(:name, :age, :phone_number, :national_id, :payrate)
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
