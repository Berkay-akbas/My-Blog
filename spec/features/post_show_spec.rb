require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Post Show', type: :request do
  subject { page }

  before(:each) do
    User.create(name: 'John Doe', posts_count: 5, id: 1, photo: 'https://i.imgur.com/1J3wZQx.jpg',
                bio: 'I am John Doe')
    Post.create(title: 'title', text: 'text1', comments_count: 2, likes_count: 3, author_id: 1, id: 1)
    Comment.create(author_id: 1, post_id: 1, text: 'comment1')
    Comment.create(author_id: 2, post_id: 1, text: 'comment2')
  end

  it 'renders the title of the post' do
    get user_post_path(1, 1)
    expect(response.body).to include('title')
  end

  it 'renders the like button' do
    visit user_posts_path(1)
    expect(page).to have_content('Like')
  end

  it 'renders the post author' do
    visit user_posts_path(1)
    expect(page).to have_content('John Doe')
  end

  it 'renders the name of the user' do
    get user_posts_path(1)
    expect(response.body).to include('John Doe')
  end

  it 'renders the number of likes of the post' do
    visit user_posts_path(1)
    expect(page).to have_content('3')
  end

  it 'renders the number of comments of the post' do
    visit user_posts_path(1)
    expect(page).to have_content('2')
  end

  it 'renders the text of the post' do
    visit user_posts_path(1)
    expect(page).to have_content('text1')
  end

  it 'renders the username of the each commenter' do
    visit user_posts_path(1)
    expect(page).to have_content('John Doe')
  end

  it 'renders the comments of the each commenter' do
    visit user_posts_path(1)
    expect(page).to have_content('comment1')
  end
end
