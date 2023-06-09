class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:likes, :comments)
  end

  def show
    @user = User.find(params[:user_id])
    # @post = Post.find(params[:id])
    @post = Post.includes(:likes, :comments).find(params[:id])
    @likes = @post.likes
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.likes_counter = 0
    @post.comments_counter = 0
    return unless @post.save

    redirect_to user_posts_path
    flash[:success] = 'Post created!'
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:success] = 'Post deleted!'
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
