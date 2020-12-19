class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
     if@user_order.valid? 
       @user_order.save

        redirect_to root_path
     else
       render :index
     end
  end

  private
 
 def order_params
  params.require(:user_order).permit(:number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id ,item_id: current_user.id)
 end

end
