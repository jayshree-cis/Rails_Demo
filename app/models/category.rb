class Category < ApplicationRecord

  validates :name , presence: true

  has_many :products
  has_many :subcategories, class_name: "Category",foreign_key: "maincategory_id", dependent: :destroy
  belongs_to :maincategory, class_name: "Category", optional: true , dependent: :destroy
  
end

