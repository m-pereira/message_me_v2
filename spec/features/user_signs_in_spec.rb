require 'rails_helper'

RSpec.describe 'user signs in', type: :feature do
  let!(:user) { create(:user) }

  scenario 'signing in with correct credentials' do
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Login'

    expect(page).to have_content('You have successfully logged in.')
  end

  scenario 'incorrect credentials' do
    visit login_path
    fill_in 'Username', with: 'wrong'
    fill_in 'Password', with: 'wrong'
    click_button 'Login'

    expect(page).to have_content('There was something wrong with your login information.')
  end
end
