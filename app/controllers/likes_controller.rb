class LikesController < ApplicationController
  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    @like.save
    @like.update_post_likes_counter
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end
end
