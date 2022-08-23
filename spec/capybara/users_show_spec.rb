require 'rails_helper'

RSpec.describe 'Users Page', type: :system do
  before(:each) do
    @user = User.first
  end

  it 'Shows the user profile picture' do
    visit user_path(@user)
    expect(page.find('#profile-img')['src']).to have_content(@user.photo)
  end
end
