Rails.application.routes.draw do
  root to: 'visitors#index'
  
  devise_for :users
  
  resources :users
  get 'bank', to: 'profile#bank'
  get 'profile/dashboard', to: 'profile#dashboard'
  
  resources :profile , shallow: true do
    
    resources :dashboard
    resources :properties
    
  end
  
end
