class CartsController < ApplicationController
  def show
    @cart = @current_cart
    @selected_shop = params[:shop_id]
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
  
  def waiting 
    @current_cart.line_items.each do |item|
      item.waiting = true
    end
    redirect_to root_path
    # @order = Order.new(order_params)
    # @current_cart.line_items.each do |item|
    #   @order.line_items << item
    #   item.cart_id = nil
    # end
    # @order.save
    # Cart.destroy(session[:cart_id])
    # session[:cart_id] = nil
    # redirect_to root_path
  end
end