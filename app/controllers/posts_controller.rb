class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find_by_id(params[:user_id])
    @users = User.all
  end

  def show
    @post = Post.find_by_id(params[:id])
    @posts = Post.all
    @users = User.all
    @user = User.find_by_id(params[:user_id])
  end
end
