require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: 'John Doe', posts_count: 5, id: 1, photo: 'https://i.imgur.com/1J3wZQx.jpg',
                        bio: 'I am John Doe')
  end
  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it "placeholder has text 'Users'" do
      expect(response.body).to include('Number of posts:')
    end
  end
  describe 'GET #show' do
    before(:example) { get user_path(1) } # get(:show, id: 1)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it "placeholder has text 'User'" do
      expect(response.body).to include('John Doe')
    end
  end
end
