class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
    
    if current_user.id == @item.user_id

      redirect_to root_path

    else

      render:index

    end

  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
     if@user_order.valid?
      pay_item
       @user_order.save

        redirect_to root_path
     else
       render :index
     end
  end

  private
 
 def order_params
  params.require(:user_order).permit( :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id ,item_id: current_user.id, token: params[:token])
 end

 def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
 end

end
