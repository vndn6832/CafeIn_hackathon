class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order(created_at: :DESC)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    

  end

  # GET /posts/1/edit
  def edit
 
  end

  # POST /posts
  # POST /posts.json
  def create
    if current_user == nil
      redirect_to '/users/sign_in'
    else
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
      else
      render :new 
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit 
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit([:title, :content])
    end

end
