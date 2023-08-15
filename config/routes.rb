Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :entities
  resources :groups
  resources :categorizations
  # Defines the root path route ("/")
   root "categorizations#index"
end
