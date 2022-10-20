class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def update_post_comments_counter
    post = Post.find(post_id)
    post.update_attribute :comments_count, post.comments.count
  end
end
