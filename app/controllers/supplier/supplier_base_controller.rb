class Supplier::SupplierBaseController  < ApplicationController
  
  def check_role
    if is_supplier?

    else
      redirect_to root_path
    end 
  end  
     
end
