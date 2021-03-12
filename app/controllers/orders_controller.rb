class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private
  def order_params
    params.require(:order_delivery).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :order_id, :user_id, :item_id).merge(token: params[:token])
  end
end
