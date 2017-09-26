class OrdersController < ApplicationController
  def index
    @orders = Order.all
    redirect_to root_path
  end

  def show
    @order = Order.find(params[:id])
  end

  def new

    @order = Order.new

  end
  
  
  
  def create
    @order = Order.new(order_params)
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    item.waiting = 1
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    # Cart.destroy(@current_cart.id)
    # @current_cart.id = nil
    redirect_to root_path
    end
  end
  
  private
    def order_params
      params.require(:order).permit(:name, :email, :address, :pay_method)
    end
end






  # def new
  #   @order = Order.new
  #   @current_cart.line_items.each do |item|
  #     @order.line_items << item
  #     item.waiting = true
  #   end
  #   @order.save
  #   # Cart.destroy(session[:cart_id])
  #   # session[:cart_id] = nil
  #   redirect_to root_path
  # end
  
  # def create
  #   @order = Order.new(order_params)
  #   @current_cart.line_items.each do |item|
  #     @order.line_items << item
  #     item.cart_id = nil
  #     @order.shop_id = params[:shop_id]
  #     @order.user_id = current_user.id
  #     item.waiting = true
  #   end
  #   @order.save
  #   redirect_to root_path
  # end