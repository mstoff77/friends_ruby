Rails.application.routes.draw do
  devise_for :users
  resources :friends_lists
  get 'home/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "home#index"
  root "friends_lists#index"
end
