class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_user_posts_counter
    user = User.find(author_id)
    user.update(posts_count: user.posts.count)
  end
end
