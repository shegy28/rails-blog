class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :asc).includes(:posts)
  end

  def show
    @user = User.includes(posts: [:likes, :comments]).find(params[:id])
  end
end
