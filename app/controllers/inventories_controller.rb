class InventoriesController < ApplicationController
  
  before_action :set_property, only: %i[ show update destroy ]
  before_action :authenticate_user, only: [:create, :update, :destroy]

  # GET /inventories
  def index
    @inventories = Inventory.all

    render json: @inventories
  end

  # GET /inventories/1
  def show
    render json: @inventory
  end

  # POST /inventories
  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      render json: @inventory, status: :created, location: @inventory
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inventories/1
  def update
    if @inventory.update(inventory_params)
      render json: @inventory
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inventories/1
  def destroy
    @inventory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.require(:inventory).permit(:name, :brand, :status, :quantity, :construction_site_id, :suppliers, :suppliers_contact)
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
