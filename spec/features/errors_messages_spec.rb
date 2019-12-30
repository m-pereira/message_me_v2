require 'rails_helper'

RSpec.describe 'Errors messages' do
  context 'when signup' do
    scenario 'has errors when user enter invalid information on signup' do
      visit signup_path
      within('.ui.form') do
        find("input[type='submit']").click
      end

      expect(page).to have_content('Username can\'t be blank')
      expect(page).to have_content('Password can\'t be blank')
    end
  end

  context 'when edit' do
    let!(:user) { create(:user) }

    before do
      sign_in(user)
    end

    scenario 'has errors when user enter invalid information on edit account' do
      visit edit_user_path(user)
      fill_in placeholder: 'username', with: ''
      within('.ui.form') do
        find("input[type='submit']").click
      end

      expect(page).to have_content('Username can\'t be blank')
      expect(page).to have_content('Password can\'t be blank')
    end
  end
end
