class Admin::DashboardController < Admin::AdminBaseController
  before_action :check_role , only: [:index ]

  def index   
  end
  
end
