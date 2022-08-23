require 'rails_helper'
RSpec.describe 'Users Page', type: :system do
  before :all do
    @user = User.first
    @post = @user.posts.first
  end
  describe 'index page' do
    it 'Show the post title' do
      visit user_post_path(@user, @post)
      expect(page).to have_content(@post.title)
    end
    it 'Show the post author' do
      visit user_post_path(@user, @post)
      expect(page).to have_content("By #{@user.name}")
    end
    it 'Show post comments count' do
      visit user_post_path(@user, @post)
      expect(page).to have_content("#{@post.comments_count} Comments")
    end
    it 'Show post likes count' do
      visit user_post_path(@user, @post)
      expect(page).to have_content("#{@post.likes_count} Likes")
    end
    it 'Show post body text' do
      visit user_post_path(@user, @post)
      expect(page).to have_content(@post.text)
    end
    it 'Show the username of each commentator' do
      visit user_post_path(@user, @post)
      @post.comments.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end
  end
end
