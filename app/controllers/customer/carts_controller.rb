class Customer::CartsController < Customer::CustomerBaseController
  before_action :current_cart , only: [:create ,:update , :destroy ,:index]
  before_action :check_role , only: [:index ]
  
  def index
      @cart_products = @cart.cart_products
      @total_ammount = @cart_products.pluck(:total_amount).sum
  end

  def create
    if @cart.present?
      price = Product.find(params[:id]).price
      cart_product = @cart.cart_products.new(product_id: params[:id], total_amount: price)
      if cart_product.save
         flash[:notice] = "Product added in cart successfully"
         redirect_to  customer_carts_path
      else 
         redirect_to customer_products_path
      end 
    else
      Cart.create(user_id: current_user.id)
    end
  end

  def destroy     
    if @cart.cart_products.find_by(product_id: params[:id]).delete
      flash[:notice] = "Product Deleted from cart successfully"
      redirect_to  customer_products_path
    else 
      redirect_to customer_carts_path
    end   
  end

  def update
    cart_product = @cart.cart_products.find_by(product_id: params['product_id'])
    price = cart_product.product.price
    cart_product.update(quantity: params['quantity'] ,total_amount: price*params['quantity'].to_f)
  end

  def current_cart
    @cart = current_user.carts.find_by(status: true)
  end

end