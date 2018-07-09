# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"

  devise_for :admins

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :books do
    resources :reviews
    member do
      put "favorite", to: "books#favorite"
      put "unfavorite", to: "books#unfavorite"
      put "read", to: "books#read"
    end

    collection do
      match "search" => "books#search", via: %i[get post], as: :search
    end
  end

  resources :profile
end
