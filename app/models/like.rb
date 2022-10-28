class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  validates :author_id, uniqueness: { scope: :post_id }

  def update_post_likes_counter
    post = Post.find(post_id)
    post.update(likes_count: post.likes.count)
  end
end
