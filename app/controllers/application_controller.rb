# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_id?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_user
    redirect_to root_path, alert: 'You must be logged in to perform that.' unless logged_in?
  end
end
