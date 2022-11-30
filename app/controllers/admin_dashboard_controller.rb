class AdminDashboardController < ApplicationController
  def index
    authorize! :read, :admin_dashboard
  end

  def show
  end
end
