require 'rails_helper'

RSpec.describe 'User tries to edit another account' do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }

  before do
    sign_in(user)
  end

  scenario 'failure' do
    visit edit_user_path(another_user)

    expect(page).to have_content('You can only edit your own account.')
    expect(page).to have_current_path(root_path)
  end

  scenario 'success' do
    visit edit_user_path(user)

    expect(page).to have_content('Edit your account')
    expect(page).to have_current_path(edit_user_path(user))
  end
end
