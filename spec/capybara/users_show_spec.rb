require 'rails_helper'

RSpec.describe 'Users Page', type: :system do
  before(:each) do
    @user = User.first
  end

  it 'Shows the user profile picture' do
    visit user_path(@user)
    expect(page.find('#profile-img')['src']).to have_content(@user.photo)
  end

  it 'Shows the user name' do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'Shows the number of posts created by user' do
    visit user_path(@user)
    expect(page).to have_content("#{@user.posts_count} Posts")
  end

  it 'Shows the user bio' do
    visit user_path(@user)
    expect(page).to have_content(@user.bio)
  end

  it 'Shows the the last 3 posts created by the user' do
    visit user_path(@user)
    @user.last_three_posts do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end

  it 'Shows Load more button link' do
    visit user_path(@user)
    expect(page).to have_content('Load more')
  end

  it 'Redirects posts/show page when the user clicks on the post title' do
    visit user_path(@user)
    post = @user.posts.first
    click_link(post.title)
    expect(page).to have_content(post.title)
  end

  it 'Redirects users all posts page when the user clicks on the Load more link' do
    visit user_path(@user)
    click_link('Load more')
    expect(page).to_not have_content('Load more')
  end
end
