Rails.application.routes.draw do  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  root "static_pages#home"
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "/create", to:"ratings#create"
  get "/comment", to:"ratings#create"
  get "/export", to:"users#export"
  get "/feeds", to:"feeds#index"
  namespace :admin  do
    resources :books
  end
  resources :users
  resources :books
  resources :carts
  resources :borrows
  resources :authors
  resources :feeds
  resources :categorys
end
