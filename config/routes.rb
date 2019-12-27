# frozen_string_literal: true

Rails.application.routes.draw do
  get 'chatroom/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'chatroom#index'

  get 'login', to: 'sessions#new'
  resources :sessions, only: [:create, :destroy]
end
