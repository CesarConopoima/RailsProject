class AdminController < ApplicationController
  #before_filter :authorize
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
  	@total_orders = Order.count
  end
end
