# frozen_string_literal: true

Rails.application.routes.draw do
  root 'chatroom#index'

  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:create, :edit, :update]
end
