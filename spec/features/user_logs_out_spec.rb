require 'rails_helper'

RSpec.describe 'user logs out' do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  scenario 'success' do
    expect(page).to have_current_path(root_path)

    within('.ui.small.blue.inverted.menu') do
      click_link 'Log out'
    end

    expect(page).to have_content('You have logged out.')
    expect(page).to have_current_path(login_path)
  end
end
