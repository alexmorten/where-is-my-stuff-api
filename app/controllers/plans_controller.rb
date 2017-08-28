class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # GET /plans
  def index
    @plans = @current_user.plans

    render json: @plans
  end

  # GET /plans/1
  def show
    render json: @plan
  end

  # POST /plans
  def create
    @plan = Plan.new(plan_params)
    @plan.user = @current_user
    if @plan.save
      render json: @plan, status: :created, location: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1
  def update
    if @plan.update(plan_params)
      render json: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plans/1
  def destroy
    @plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plan_params
      params.require(:plan).permit(:name).tap do |whitelisted|
         whitelisted[:representation] = params[:plan].fetch(:representation, ActionController::Parameters.new).permit!
      end
    end
end
