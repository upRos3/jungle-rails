class Admin::DashboardController < Admin::AdminAuthController
  before_filter :authorize

  def show; end
end
