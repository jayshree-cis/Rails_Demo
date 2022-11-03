class Customer::CategoriesController < Customer::CustomerBaseController
  before_action :check_role , only: [:index ]

  def show
     category = Category.find(params[:id])
     @subcategories = category.subcategories
  end

end
