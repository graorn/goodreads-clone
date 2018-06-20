# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :books
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
