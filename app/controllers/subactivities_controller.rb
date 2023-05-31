class SubactivitiesController < ApplicationController
    before_action :set_subactivity, only: %i[show update destroy]
  
    # GET /subactivities
    def index
      @subactivities = Subactivity.all
      render json: @subactivities
    end
  
    # GET /subactivities/1
    def show
      render json: @subactivity
    end
  
    # POST /subactivities
    def create
      @subactivity = Subactivity.new(subactivity_params)
  
      if @subactivity.save
        render json: @subactivity, status: :created, location: @subactivity
      else
        render json: @subactivity.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /subactivities/1
    def update
      if @subactivity.update(subactivity_params)
        render json: @subactivity
      else
        render json: @subactivity.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /subactivities/1
    def destroy
      @subactivity.destroy
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_subactivity
      @subactivity = Subactivity.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def subactivity_params
      params.require(:subactivity).permit(:name, :activity_id, :description, :start_date, :end_date, :status)
    end
  end
  