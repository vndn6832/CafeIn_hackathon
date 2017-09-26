class ShopsController < ApplicationController
  
  def location
    # render layout: false
  end
  
  def near_shop
      @current_lat = params[:lat]
      @current_lon = params[:long]
      @shop = Shop.select("id, Name, (6371*acos(cos(radians("+@current_lat+"))*cos(radians(Latitude))*cos(radians(Longtitude)-radians("+@current_lon+"))+sin(radians("+@current_lat+"))*sin(radians(Latitude)))) AS Distance").group("Distance").having("Distance < ?", 2)  
      # p @lat.to_i - @long.to_i
      
  end
  
  def index
    @shops = Shop.all
  end

  def show
    if current_user == nil
      redirect_to '/users/sign_in'
    else
    @shop = Shop.find(params[:id])
    @products = Product.where(shop_id: params[:id])
    @comments = Comment.where(shop_id: params[:id])
    @average = @comments.average(:stars)
    @favorite = Favorite.find_by(shop_id: @shop.id, user_id: current_user.id)
    end
  end
  
  def pay
    
    @selected_product = Product.find_by_id(params[:id])
    @products = Product.where(id: params[:id])
    
  end
  
  def result
    # @shops = Shop.all
    if params[:search]
      @shops = Shop.search(params[:search]).order("created_at DESC")
    else
      @shops = Shop.all.order("created_at DESC")
    end
  end
end
