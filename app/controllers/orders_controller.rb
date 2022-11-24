class OrdersController < ApplicationController
  load_and_authorize_resource
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @current_cart=current_user.cart
     if @order.save
      @current_cart.cart_products.each do |product|
        Orderproduct.create!(order_id: @order.id,product_id:product.product.id,quantity:product.quantity)
      end  
     end
    @current_cart.cart_products.destroy_all
    redirect_to order_path(@order)
  end
  
  private
    def order_params
      params.permit(:name, :email, :address,:user_id)
    end

end
