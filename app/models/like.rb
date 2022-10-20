class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_post_likes_counter
    post = Post.find(post_id)
    post.update(likes_count: post.likes.count)
  end
end
