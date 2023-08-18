Rails.application.routes.draw do
  root "groups#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/splash", to: 'users#index'
  resources :entities
  resources :groups
  resources :categorizations
  # Defines the root path route ("/")
end
