class Item < ApplicationRecord

  validates :name,presence: true, length: { maximum: 40 }
  validates :introduction,presence: true, length: { maximum: 1000 }
  validates :category_id,presence: true
  validates :status_id,presence: true
  validates :delivery_charge_id,presence: true
  validates :delivery_area_id,presence: true
  validates :delivery_day_id,presence: true
  validates :price,presence:true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validates :image, presence: true

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

end
