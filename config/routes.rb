Rails.application.routes.draw do
  devise_for :accounts
  resources :properties
  
  # Admin Route
  get "/accounts" => 'admin#accounts', as: :accounts
  
  # Public Pages
  get "/propertylist" => 'public#properties', as: :propertylist
  get "/advertizing" => 'public#advertizing', as: :advertizing
  get "/realtors" => 'public#realtors', as: :realtors
  get "/loans" => 'public#loans', as: :loans
  get "/contact" => 'public#contact', as: :contact

  get "/dashboard" => 'dashboard#index', as: :dashboard
  get "/profile:id" => 'properties#profile', as: :profile
  post "/agent/viewing" => 'properties#viewing', as: :viewing 
  
  # Root Page
  root to: 'public#main'
end
