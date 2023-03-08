Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "/discover", to: "pages#discover"
  resources :categories, only: [:show]
  resources :channels, only: [:show, :index]
  resources :clips, only: [:index]
end
