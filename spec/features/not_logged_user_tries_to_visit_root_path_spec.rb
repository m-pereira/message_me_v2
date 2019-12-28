require 'rails_helper'

RSpec.describe 'not logged user tries to visit root path spec' do
  scenario 'not logged user' do
    visit root_path

    expect(page).to have_content('You must be logged in to perform that.')
    expect(page).to have_current_path(login_path)
  end
end
