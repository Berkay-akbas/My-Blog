class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :comments_count, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  def liked?(user)
    likes.find_by(author_id: user.id).present?
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_user_posts_counter
    user = User.find(author_id)
    user.update(posts_count: user.posts.count)
  end
end
