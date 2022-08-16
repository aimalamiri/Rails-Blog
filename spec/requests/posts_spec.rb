require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  it 'returns status 200 Ok for /users/1/posts' do
    get '/users/1/posts'
    expect(response).to have_http_status :success
  end

  it 'returns posts/index view for posts/index action' do
    get '/users/1/posts'
    expect(response).to render_template :index
  end

  it 'returns posts/index view that includes the posts keyword' do
    get '/users/1/posts'
    expect(response.body).to include 'posts'
  end
end
