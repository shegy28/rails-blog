class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(created_at: :asc).includes(:posts)
  end

  def show
    @user = User.includes(posts: %i[likes comments]).find(params[:id])
  end
end
