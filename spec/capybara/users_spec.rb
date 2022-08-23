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

    it 'Show the posts_count for all users' do
      visit users_path
      @users.each do |user|
        expect(page).to have_content("#{user.posts_count} Posts")
      end
    end
  end
end
