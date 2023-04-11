class PostsController < ApplicationController
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
    @user = current_user
    @post = @user.posts.new(author: @user, title: params[:post][:title], text: params[:post][:text])

    if @post.save
      @post.update_posts_counter
      flash[:notice] = 'Your post was created successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash.alert = 'sorry, something went wrong!'
      render :new
    end
  end
end
