Rails.application.routes.draw do
  root to: 'visitors#index'
  
  devise_for :users
  resources :users

  resources :profile 
    
  get 'bank', to: 'profile#bank'
  get 'dashboard', to: 'profile#dashboard'
  get 'properties', to: 'profile#properties'
  resources :properties
  
end
