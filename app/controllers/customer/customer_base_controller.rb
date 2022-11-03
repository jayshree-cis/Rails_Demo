class Customer::CustomerBaseController < ApplicationController
  
  def check_role
    if is_customer?

    else
      redirect_to root_path
    end 
  end 
     
end
