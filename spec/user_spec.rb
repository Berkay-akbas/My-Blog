require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'John Doe', posts_count: 5) }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post count should be greater than or equal to 0' do
    subject.posts_count = -1
    expect(subject).to_not be_valid
  end

  it 'Recent posts should be ordered by created_at' do
    expect(subject.recent_posts).to eq(subject.posts.order(created_at: :desc).limit(5))
  end
end
