class Admin::OrdersController <Admin::AdminBaseController 
  before_action :check_role , only: [:index ]
  
  def index
    @orders = Order.all
  end

  def show
    @cart_products = CartProduct.where(cart_id: params[:id])
  end

  def update
    @order = Order.find(params[:order_id]).update(status: params[:status])
  end

end
