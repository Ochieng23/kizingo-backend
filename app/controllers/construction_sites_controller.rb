class ConstructionSitesController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]
  before_action :set_construction_site, only: [:show, :update, :destroy]
  
  # GET /construction_sites
  def index
    @construction_sites = ConstructionSite.all
    render json: @construction_sites
  end
  
  # GET /construction_sites/1
  def show
    render json: @construction_site
  end
  
  # POST /construction_sites
  def create
    @construction_site = ConstructionSite.new(construction_site_params)
  
    if @construction_site.save
      render json: @construction_site, status: :created, location: @construction_site
    else
      render json: @construction_site.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /construction_sites/1
  def update
    if @construction_site.update(construction_site_params)
      render json: @construction_site
    else
      render json: @construction_site.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /construction_sites/1
  def destroy
    @construction_site.destroy
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_construction_site
    @construction_site = ConstructionSite.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def construction_site_params
    params.require(:construction_site).permit(
      :name,
      :description,
      :start_date,
      :end_date,
      :status,
      architecturalDesign: [], # Permit an array of URLs for architecturalDesign
      currentProgress: [] # Permit an array of URLs for currentProgress
    )
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
