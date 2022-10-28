class CommentsController < ApplicationController
  def create
    @comment = Comment.new(text: params[:text], author_id: current_user().id, post_id: params[:post_id])
    @comment.save
    @comment.update_post_comments_counter
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end
end