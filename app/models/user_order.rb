class UserOrder
  include ActiveModel::Model
  attr_accessor :token, :purchase_id, :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    # validates :number, format: { with: /\A[a-zA-Z0-9]+\z/ }
    # validates :exp_month, format: { with: /\A[0-9]\z/ }
    # validates :exp_year, format: { with: /\A[0-9]{,2}\z/ }
    # validates :cvc, format: { with: /\A[0-9]{,4}\z/ }
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-?[0-9]{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :house_number
    #validates :building_name
    validates :phone_number, format: { with: /\A[0-9]{,11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    address = Address.create(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end
