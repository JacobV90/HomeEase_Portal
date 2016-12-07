Rails.application.routes.draw do
  root to: 'visitors#index'
  

  devise_for :users
  resources :users do
    delete 'remove', on: :member
    
  end
  
  #pages users can visit without being signed in
  resources :visitors do
    get 'listings', on: :member
    get 'about', on: :member
  end
  
  post 'user_state', to: 'visitors#user_state'

  resources :profile 

  get 'maintenanceIssue', to: 'profile#maintenanceIssue'
  get 'bank', to: 'profile#bank'
  get 'dashboard', to: 'profile#dashboard'
  get 'settings', to: 'profile#settings'
  get 'update', to: 'profile#update'
  put 'profile_update', to: 'profile#'
  #post 'edit_profile', to: 'profile#dashboard'
  #used for firebase notifications - doesnt render ui
  post 'notifications', to: 'profile#notifications' 
  
  resources :properties
  post 'create_property', to: 'properties#create'
  post 'upload', to: 'properties#'
end
