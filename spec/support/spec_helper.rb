module SpecHelper
  def login(user)
    session[:user_id] = user.id
  end

  def sign_in(user)
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Login'
  end
end
