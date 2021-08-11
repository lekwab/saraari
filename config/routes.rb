Rails.application.routes.draw do
  devise_for :accounts
  resources :properties
  
  # Admin Route
  get "/accounts" => 'admin#accounts', as: :accounts

  get "/dashboard" => 'dashboard#index', as: :dashboard
  get "/profile:id" => 'properties#profile', as: :profile
  post "/agent/viewing" => 'properties#viewing', as: :viewing 
  
  
  root to: 'public#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
