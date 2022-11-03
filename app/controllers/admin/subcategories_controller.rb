class Admin::SubcategoriesController < Admin::AdminBaseController
  #  before_action :fetch_category , only: [:show ,:new ,:create ,:add ]
  before_action :check_role , only: [:index ]
   
  def index
      @subcategories = Category.all
   end

   def show
     @subcategory = Category.find(params[:id])
   end

   def new
     # debugger
     @subcategory = Category.find(params[:id]).subcategories.new
   end
 
   def create
     @subcategory = Category.find(params[:id]).subcategories.create(category_params)
     if @subcategory.save
       redirect_to admin_category_path
     else
       render :new
     end
   end


  #  def fetch_category
  #    @subcategory = Category.find(params[:id])
  #  end

   private
     
   def category_params
     params.require(:category_subcategory).permit(:name )
   end
 
 end
 