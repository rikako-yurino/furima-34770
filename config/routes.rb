Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:destroy]
  resources :items
  resources :orders, only: [:index, :create]
  resources :deliveries, only: :create
end
