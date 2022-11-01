require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Post Show', type: :request do
  subject { page }

  before(:each) do
    User.create(name: 'John Doe', posts_count: 5, id: 1, photo: 'https://i.imgur.com/1J3wZQx.jpg',
                bio: 'I am John Doe')
    Post.create(title: 'title1', text: 'text1', comments_count: 0, likes_count: 0, author_id: 1, id: 1)
    Like.create(author_id: 1, post_id: 1)
  end

  it 'renders the title of the post' do
    get user_posts_path(1)
    expect(response.body).to include('text1')
  end

  it 'renders the picture of the user' do
    get user_posts_path(1)
    expect(response.body).to include('https://i.imgur.com/1J3wZQx.jpg')
  end

  it 'renders the name of the user' do
    get user_posts_path(1)
    expect(response.body).to include('John Doe')
  end

  it 'renders the number of likes of the post' do
    get user_posts_path(1)
    expect(response.body).to include('0')
  end

  it 'renders the number of comments of the post' do
    get user_posts_path(1)
    expect(response.body).to include('0')
  end

  it 'renders the text of the post' do
    get user_posts_path(1)
    expect(response.body).to include('text1')
  end

  it "when click on post title, it redirects to the post's show page", js: true do
    visit user_posts_path(1)
    click_link_or_button('Post #1')
    expect(page).to have_current_path(user_post_path(1, 1))
  end
end
