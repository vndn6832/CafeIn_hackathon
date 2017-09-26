class CommentsController < ApplicationController
  
  def new
    
  end
  
  def create
    
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.user_id = current_user.id
    # @comment.stars = params[:rating]
    @comment.shop_id = params[:shop_id]
    @comment.save
    
    redirect_to "/shops/#{@comment.shop_id}"
      
  end
  
  def destroy
    @comment = Comment.find_by(id: params[:id], user_id: current_user.id)
    @comment.destroy
    
    redirect_to "/shops/#{@comment.shop_id}"
  
  end

end