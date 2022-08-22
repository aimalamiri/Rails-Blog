require 'rails_helper'

RSpec.describe 'Users Page', type: :system do
  describe 'index page' do
    it 'Show all users page in the title' do
      visit users_path
      expect(page).to have_content('All users page')
    end
  end
end
