require 'rails_helper'

RSpec.describe 'Users Page', type: :system do
  before(:each) do
    @user = User.first
  end

  it 'Shows the user profile picture' do
    visit user_posts_path(@user)
    expect(page.find('#profile-img')['src']).to have_content(@user.photo)
  end

  it 'Shows the user name' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'Shows the number of posts created by user' do
    visit user_posts_path(@user)
    expect(page).to have_content("#{@user.posts_count} Posts")
  end

  it 'Shows the title of a post' do
    visit user_posts_path(@user)
    post = @user.posts.first
    expect(page).to have_content(post.title)
  end

  it 'Shows the body of a post' do
    visit user_posts_path(@user)
    post = @user.posts.first
    expect(page).to have_content(post.text)
  end

  it 'Shows the comments of a post' do
    visit user_posts_path(@user)
    post = @user.posts.first
    post.last_five_comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'Shows the post comments count' do
    visit user_posts_path(@user)
    post = @user.posts.first
    expect(page).to have_content("#{post.comments_count} Comments")
  end

  it 'Shows the post likes count' do
    visit user_posts_path(@user)
    post = @user.posts.first
    expect(page).to have_content("#{post.likes_count} Likes")
  end

  it 'Redirects posts/show page when the user clicks on the post title' do
    visit user_posts_path(@user)
    post = @user.posts.first
    click_link(post.title)
    expect(page).to have_content(post.title)
  end
end
