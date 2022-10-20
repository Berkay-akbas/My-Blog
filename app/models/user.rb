class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def user_post_count
    puts "posts count: #{posts_count}"
  end
end
