class Supplier::DashboardController < Supplier::SupplierBaseController
  before_action :check_role , only: [:index ]

  def index 
     @categories = Category.all    
  end
   
end
