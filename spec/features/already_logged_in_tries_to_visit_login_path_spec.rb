require 'rails_helper'

RSpec.describe 'already logged in tries to visit login path' do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  scenario 'already logged' do
    visit login_path

    expect(page).to have_content('You are already logged in.')
    expect(page).to have_current_path(root_path)
  end
end
