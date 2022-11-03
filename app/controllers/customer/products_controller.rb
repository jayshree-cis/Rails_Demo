class Customer::ProductsController < Customer::CustomerBaseController
  before_action :check_role , only: [:index , :show]

  def index
      @products = Product.all
  end

  def show
    @products = Category.find(params[:id]).products
  end
  
end
