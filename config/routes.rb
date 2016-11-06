Rails.application.routes.draw do
  root to: 'visitors#index'
  
  devise_for :users
  resources :users

  resources :profile 
    
  get 'bank', to: 'profile#bank'
  get 'dashboard', to: 'profile#dashboard'
  
  resources :properties
  
end
