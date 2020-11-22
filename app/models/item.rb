class Item < ApplicationRecord
 with_options presence: true do
  validates :name, length: { maximum: 40 }
  validates :introduction, length: { maximum: 1000 }
  validates :category_id
  validates :status_id
  validates :delivery_charge_id
  validates :delivery_area_id
  validates :delivery_day_id
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image
 end

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
end
