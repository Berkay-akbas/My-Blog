class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_post_comments_counter
    post = Post.find(post_id)
    post.update_attribute :comments_count, post.comments.count
  end
end
