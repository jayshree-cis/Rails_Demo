class Product < ApplicationRecord

  validates :name , :price , :description , :image , presence: true
  has_many :cart_products
  has_many :cart, through: :cart_products
  belongs_to :category
  mount_uploader :image, ImageUploader
  has_many :orders
  
end
