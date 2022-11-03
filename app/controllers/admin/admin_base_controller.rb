class Admin::AdminBaseController < ApplicationController
    
  def check_role
      if is_admin?
      else
        redirect_to root_path
      end 
   end  
         
end
