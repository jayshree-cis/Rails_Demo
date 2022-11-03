class User < ApplicationRecord
  rolify

  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :products, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  pay_customer stripe_attributes: :stripe_attributes

  after_create :assign_default_role 

  def assign_default_role
    self.add_role(:customer) if self.roles.blank?
  end

  def stripe_attributes(pay_customer)
    {
      address: {
        city: pay_customer.owner.city,
        country: pay_customer.owner.country
      },
      metadata: {
        pay_customer_id: pay_customer.id,
        user_id: id # or pay_customer.owner_id
      }
    }
  end

end
