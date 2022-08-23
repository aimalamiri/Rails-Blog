require 'rails_helper'

RSpec.describe 'Users Page', type: :system do
  before :all do
    @users = User.all
  end

  describe 'index page' do
    it 'Show the user name of all users' do
      visit users_path
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'Should load the image of each user' do
      visit users_path
      expect(page).to have_selector('img')
    end

    it 'Show the posts_count for all users' do
      visit users_path
      @users.each do |user|
        expect(page).to have_content("#{user.posts_count} Posts")
      end
    end
  end
end
