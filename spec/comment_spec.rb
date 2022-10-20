require 'rails_helper'

RSpec.describe Comment, type: :model do
  let (:user) { User.create(name: 'John Doe', posts_count: 5, id: 1) }
  let (:post) { Post.create(title: 'title', text: 'text', comments_count: 0, likes_count: 0, author_id: user.id) }
  subject { Comment.create(text: 'text', author_id: user.id, post_id: post.id) }

  before { subject.save }

  it 'Author should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'Post should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'update_post_comments_counter should update post comments count' do
    subject.update_post_comments_counter
    post = Post.find(subject.post_id)
    expect(post.comments_count).to eq(post.comments.count)
  end
end