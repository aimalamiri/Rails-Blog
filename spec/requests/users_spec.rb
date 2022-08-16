require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  it 'returns 200 Ok for index action on /users' do
    get '/users'
    expect(response).to have_http_status :success
  end

  it 'returns the users/index view for index action on /users' do
    get '/users'
    expect(response).to render_template :index
  end

  it 'return the users/index view includes the All Users placeholder text' do
    get '/users'
    expect(response.body).to include 'All users'
  end

  it 'returns 200 Ok for index action on /users/1' do
    get '/users/1'
    expect(response).to have_http_status :success
  end

  it 'returns the users/show view for show action on /users/1' do
    get '/users/1'
    expect(response).to render_template :show
  end

  it 'returns the users/show view that includes user key_word' do
    get '/users/1'
    expect(response.body).to include 'user'
  end
end
