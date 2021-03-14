class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index, only:[:index]

  def index
    @order_delivery = OrderDelivery.new
    if current_user == @item.user
      redirect_to root_path
    end 
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_delivery).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_15f70f5dc5c51f2f6a2ee0d2"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if Order.where(item_id: @item.id).present?
      redirect_to root_path
    end
  end
end
