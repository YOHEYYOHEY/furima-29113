class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }

  has_many :items
  has_many :purchases
end
