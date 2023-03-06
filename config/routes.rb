Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#dashboard'
  get '/search', to: 'pages#search'
  get '/categories/:id', to: 'categories#show'
  get '/users/:id', to: 'users#show'
  get '/clips', to: 'clips#index'
  get '/discover', to: 'pages#discover'
end
