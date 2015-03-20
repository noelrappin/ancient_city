Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :trips
  resources :orders
  resources :users
end
