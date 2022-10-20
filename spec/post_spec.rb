require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John Doe', posts_count: 5, id: 1) }
  subject { Post.create(title: 'title', text: 'text', comments_count: 0, likes_count: 0, author_id: user.id) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Comment count should be greater than or equal to 0' do
    subject.comments_count = -1
    expect(subject).to_not be_valid
  end

  it 'Like count should be greater than or equal to 0' do
    subject.likes_count = -1
    expect(subject).to_not be_valid
  end

  it 'Recent comments should be ordered by created_at' do
    expect(subject.recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
  end

  it 'update_user_posts_counter should update user posts count' do
    subject.update_user_posts_counter
    user = User.find(subject.author_id)
    expect(user.posts_count).to eq(user.posts.count)
  end
end
