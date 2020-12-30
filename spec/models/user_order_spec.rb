require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end
  
  describe '商品購入' do
   context '商品購入がうまくいくとき' do
     it "入力項目すべてが存在すれば購入できる" do
       expect(@user_order).to be_valid
     end
     
     it "building_nameが空でも購入できる" do
      @user_order.building_name = nil
      expect(@user_order).to be_valid
     end

   end

   context '商品購入がうまくいくとき' do
     it "tokenが空では購入できないこと" do
       @user_order.token = nil
       @user_order.valid?
       expect(@user_order.errors.full_messages).to include("Token can't be blank")
     end

     it "postal_codeが空では購入できないこと" do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
     end

     it "prefecture_idが空では購入できないこと" do
      @user_order.prefecture_id = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
     end

     it "cityが空では購入できないこと" do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
     end

     it "house_numberが空では購入できないこと" do
      @user_order.house_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("House number can't be blank")
     end

     it "phone_numberが空では購入できないこと" do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
     end

    
   end
  end
end
