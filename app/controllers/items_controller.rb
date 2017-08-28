class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # GET /items
  def index
    limit = params[:limit] && params[:limit].to_i <=1000 ? params[:limit] : 20
    query = params[:query] || ""
    if !@items
    @items = @current_user.items
    end
    @items = @items.where("LOWER(name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)","%#{query}%","%#{query}%")
    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    @item.user = @current_user
    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:plan_id, :name, :description).tap do |whitelisted|
        whitelisted[:representation] = params[:item].fetch(:representation, ActionController::Parameters.new).permit!
      end
    end
end
