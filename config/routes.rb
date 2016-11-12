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
  
  resources :profile 

  get 'bank', to: 'profile#bank'
  get 'dashboard', to: 'profile#dashboard'
  get 'settings', to: 'profile#settings'
  
  #used for firebase notifications - doesnt render ui
  post 'notifications', to: 'profile#notifications' 
  
  resources :properties
  post 'create_property', to: 'properties#create'

end
