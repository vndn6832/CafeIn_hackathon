class LineItemsController < ApplicationController
  def create
    # Find associated product and current cart
    @chosen_product = LineItem.where(product_id: params[:product_id], size: params[:size]).take
    current_cart = @current_cart
    @required_size = params[:size]
    @required_quantity = params[:quantity]
    
    if @required_size.nil? || @required_quantity == 0
      flash[:notice] = "사이즈와 수량을 고르셔야 합니다."
      redirect_to :back
    else
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
      unless @chosen_product.nil?
        # Find the line_item with the chosen_product
        # @chosen_product = current_cart.line_items.find_by(product_id: params[:product_id], size: params[:size])
        # @line_item = current_cart.line_items.find_by(:product_id => params[:product_id])
        # @line_item = current_cart.line_items.where("product_id LIKE ? AND size LIKE ?", "%#{params[:product_id]}%", "%#{params[:size]}%").take
        # Iterate the line_item's quantity by one
        @chosen_product.quantity += params[:quantity].to_i
      else
        @line_item = LineItem.new
        @line_item.cart = current_cart
        @line_item.product_id = params[:product_id]
        @line_item.size = params[:size]
        @line_item.quantity = params[:quantity]
        @line_item.user_id = current_user.id 
        @line_item.shop_id = params[:shop_id]
        # @line_item.request = params[:request]
        @line_item.save
      end

        # Save and redirect to cart show path
        # @line_item.save
        redirect_to cart_path(current_cart)
      end
    end
    
    def check_order
      @my_order = LineItem.where(user_id: current_user)
    end
    
  def new
    current_cart = @current_cart
    @line_item = current_cart.line_items.where(:cart_id => params[:id])
    # @line_item = LineItem.where(cart_id: params[:id])
    @line_item.each do |i|
      i.request = params[:request]
    
      i.waiting = 1
    
      
    # current_cart.destroy
    # session[:cart_id] = nil
      i.cart_id = nil
      i.save
    end
    Cart.find(params[:id]).destroy
    redirect_to root_path
  end
      
  def okay
    @chosen_product = LineItem.where(waiting: 1, shop_id: current_user.id)
  end
  
  def accept
    @chosen_order = LineItem.find_by_id(params[:id])
    @chosen_order.waiting = 2
    @chosen_order.save
    redirect_to root_path
  end
  
  def deny
    @chosen_order = LineItem.find_by_id(params[:id])
    @chosen_order.waiting = 3
    @chosen_order.save
    redirect_to root_path
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end  
  
  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end
  
  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

private
  def line_item_params
    params.require(:line_item).permit(:quantity,:product_id, :cart_id, :shop_id, :waiting)
  end
end