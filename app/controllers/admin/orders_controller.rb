class Admin::OrdersController < ApplicationController
  load_and_authorize_resource
  include ConcernHelper
  def index
    find_order
  end
end
