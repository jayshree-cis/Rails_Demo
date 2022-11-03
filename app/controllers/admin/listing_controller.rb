class Admin::ListingController < Admin::AdminBaseController
  before_action :check_role , only: [:customer_index , :supplier_index , :products_index]

	def customer_index
		 @customers = Role.find_by_name('customer').users
	end

  def supplier_index
     @suppliers= Role.find_by_name('supplier').users  
  end

  def products_index
     @products = Product.all  
  end 


end
