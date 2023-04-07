class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(author: @user, post: @post, text: params[:comment][:text])
    @comment.save
    redirect_to user_post_path(@user, @post)
  end
end
