require 'rails_helper'
require 'spec_helper'


RSpec.describe 'Users Index', type: :request do

  subject { page }

  before(:each) do
    User.create(name: 'John Doe', posts_count: 5, id: 352, photo: 'https://i.imgur.com/1J3wZQx.jpg')
    User.create(name: 'Jane Doe', posts_count: 2, id: 353, photo: 'https://i.imgur.com/1J3wZQx.jpg')
    User.create(name: 'John Smith', posts_count: 9, id: 354, photo: 'https://i.imgur.com/1J3wZQx.jpg')
    User.create(name: 'Jane Smith', posts_count: 4, id: 355, photo: 'https://i.imgur.com/1J3wZQx.jpg')
  end
  it "assigns all users to @users" do
   get users_path
   expect(assigns(:users)).to eq(User.all)
  end
  it "renders the name of the users" do
    get users_path
    expect(response.body).to include("John Doe", "Jane Doe", "John Smith", "Jane Smith")
  end
  it "renders the number of posts of the users" do
    get users_path
    expect(response.body).to include("5", "2", "9", "4")
  end
  it "renders the Number of posts" do
    visit users_path
    expect(page).to have_content("Number of posts")
  end
  it "renders the profile picture of the users" do
    get users_path
    expect(response.body).to include("https://i.imgur.com/1J3wZQx.jpg")
  end
  it "when a user is clicked, it redirects to the user's profile", js: true do
    visit users_path
    click_link_or_button('John Doe')
    expect(page).to have_current_path(user_path(352))
  end
end
