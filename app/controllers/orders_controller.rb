class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
     if@user_order.valid? 
      Payjp.api_key = "sk_test_25b8db438cfa09a71630603c"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
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

end
