# frozen_string_literal: true

class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @users = User.all
    @messages = Message.last_twenty
    @message = Message.new
  end
end
