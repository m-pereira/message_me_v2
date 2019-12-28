# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :require_owner, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome to message me #{@user.username}."
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'Account successfully updated.'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def require_owner
    unless current_user == User.find(params[:id])
      redirect_to root_path, alert: 'You can only edit your own account.'
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
