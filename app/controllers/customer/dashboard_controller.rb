class Customer::DashboardController < Customer::CustomerBaseController

  def index
    @categories = Category.all
  end
  
end
