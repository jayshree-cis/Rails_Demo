class Admin::CategoriesController < Admin::AdminBaseController
  
  before_action :fetch_category, only: [:show , :edit , :update ,:destroy] 
  before_action :check_role , only: [:index ]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
      @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit 
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end
 
  def fetch_category
    @category = Category.find(params[:id])
  end

  private
    
  def category_params
    params.require(:category).permit(:name, :maincategory_id)
  end

end
