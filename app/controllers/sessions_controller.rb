# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])

    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'You have successfully logged in.'
    else
      flash.now[:alert] = 'There was something wrong with your login information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'You have logged out.'
  end
end
