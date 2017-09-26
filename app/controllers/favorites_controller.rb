class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(name: params[:favorite_name], shop_id: params[:shop_id])
    @favorite.user_id = current_user.id if current_user
    @favorite.save

    redirect_to :back
  end
  
  def index
    @show = Favorite.where(user_id: current_user.id).order(created_at: :DESC)
  end
  
  def destroy
    @favorite = Favorite.find_by(shop_id: params[:shop_id], user_id: current_user.id)
    @favorite.destroy
    
    redirect_to :back
  end
end
