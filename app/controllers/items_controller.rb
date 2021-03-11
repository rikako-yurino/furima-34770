class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_params, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :price, :description_product, :category_id, :item_status_id, :delivery_burden_id, :delivery_area_id, :shipping_time_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def set_params
    @item = Item.find(params[:id])
  end
end
