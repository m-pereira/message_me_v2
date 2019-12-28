require 'rails_helper'

RSpec.describe 'User types a message', type: :feature do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  scenario 'user types a message' do
    expect(page).to have_content(user.username)
    message = 'Hello this is a new test.'
    fill_in placeholder: 'enter a message...', with: message
    click_button

    expect(page).to have_content(message)
  end
end
