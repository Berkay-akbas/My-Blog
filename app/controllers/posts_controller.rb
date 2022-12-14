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

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(title: params[:title], text: params[:text], author_id: current_user.id, likes_count: 0,
                     comments_count: 0)
    if @post.save
      redirect_to user_posts_path
      @post.update_user_posts_counter
    else
      render :new
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    @post.update_user_posts_counter
    redirect_to user_posts_path
  end
end
