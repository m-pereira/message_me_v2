require 'rails_helper'

RSpec.describe 'user signs_up', type: :feature do
  scenario 'good attributes' do
    visit root_path
    expect(page).to have_current_path(login_path)
    within('.ui.placeholder.segment') do
      click_link 'Sign up'
    end
    expect(page).to have_current_path(signup_path)

    fill_in placeholder: 'username', with: 'New user'
    fill_in placeholder: 'password', with: 'password'
    find("input[type='submit']").click

    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Welcome')
  end

  scenario 'bad attributes' do
    visit root_path
    expect(page).to have_current_path(login_path)
    within('.ui.placeholder.segment') do
      click_link 'Sign up'
    end
    expect(page).to have_current_path(signup_path)

    fill_in placeholder: 'username', with: 'New user'
    fill_in placeholder: 'password', with: ''
    find("input[type='submit']").click

    expect(page).to have_content('You got these errors')
    expect(page).to have_content('Password can\'t be blank')
  end
end
