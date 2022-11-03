class Customer::OrderController < Customer::CustomerBaseController
   before_action :current_cart , only: [:create]
   before_action :check_role , only: [:index ]
   
   def index
      @orders = current_user.orders
   end

   def new
      @order = Order.new()
   end

   def create
      total_amount = @cart.cart_products.pluck(:total_amount).sum
      quantity = @cart.cart_products.pluck(:quantity).sum
      order = Order.new(address: params['address'], contact_no: params['contact_no'], cart_id: @cart.id, 
                          user_id: current_user.id, quantity: quantity, total_amount: total_amount)
      if order.save
         @cart.update(status: false)
         redirect_to (customer_order_index_path)
      else
         redirect_to  customer_carts_path
      end
   end
   
   def show
      @cart_products = CartProduct.where(cart_id: params[:id])
   end
   
   private 

   def current_cart
      @cart = current_user.carts.find_by(status: true)     
   end

end
