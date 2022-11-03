class Supplier::ProductsController < Supplier::SupplierBaseController
  before_action :check_role , only: [:show]
  before_action :fetch_product , only: [:edit , :update,:destroy]

  def show
    @products= Category.find(params[:id]).products
  end
  
  def new
    @product=Product.new
  end
  
  def create
    @product = Product.new(product_params)
    @product.category_id = params[:product][:id]    
    if @product.save
      @product.update(user_id: current_user.id)
      redirect_to  supplier_category_product_path(params[:product][:id])
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to supplier_category_product_path( @product[:category_id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = "Product  deleted successfully"
      redirect_to supplier_category_product_path( @product[:category_id])
    else
      flash[:notice] = "Product not deleted  successfully"  
      redirect_to supplier_category_product_path( @product[:category_id])
    end 
  end
 
  private

  def product_params 
    params.require(:product).permit(:name, :price, :description , :image)
  end
     
  def fetch_product
    @product = Product.find(params[:id])
  end
      
end
