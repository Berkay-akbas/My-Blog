require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'John Doe', posts_count: 5, id: 1, photo: 'https://i.imgur.com/1J3wZQx.jpg',
                        bio: 'I am John Doe')
  end
  describe 'GET #index' do
    before(:example) { get user_posts_path(1) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it "placeholder has text 'Posts'" do
      expect(response.body).to include('posts')
    end
  end
  describe 'GET #show' do
    before(:example) { get user_posts_path(1, 1) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('posts/index')
    end
    it "placeholder has text 'Post'" do
      expect(response.body).to include('post')
    end
  end
end
