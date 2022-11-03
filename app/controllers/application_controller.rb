class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
 

  def is_admin?
    current_user.has_role?("admin")
  end

  def is_supplier?
    current_user.has_role?("supplier")
  end

  def is_customer?
    current_user.has_role?("customer")
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  protected
# redirecting to appropriate url based on role
  def after_sign_in_path_for(resource)
  
    if is_admin?
      admin_dashboard_index_path
    elsif is_supplier?
      supplier_dashboard_index_path
    elsif is_customer?
      customer_dashboard_path
    else
      root_path
    end
  end

  

end
