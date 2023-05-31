class ConstructionSitesController < ApplicationController
    before_action :set_construction_site, only: %i[show update destroy]
  
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
      params.require(:construction_site).permit( :name, :description, :media, :start_date, :end_date, :status)
    end
  end
  