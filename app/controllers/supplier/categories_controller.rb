class Supplier::CategoriesController < Supplier::SupplierBaseController
  before_action :check_role , only: [:show ]

  def show
     @subcategories = Category.find(params[:id]).subcategories
  end
end
