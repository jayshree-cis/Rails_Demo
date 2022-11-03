class Cart < ApplicationRecord

  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products
  belongs_to :user
  has_one :order

  # def fetch_active_cart
  #     status == true
  # end
end