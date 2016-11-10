Rails.application.routes.draw do
  root to: 'visitors#index'
  

  devise_for :users
  resources :users do
    delete 'remove', on: :member
  end
  
  resources :visitors do
    get 'listings', on: :member
    get 'about', on: :member
  end
  
  resources :profile 
    
  get 'bank', to: 'profile#bank'
  get 'dashboard', to: 'profile#dashboard'
  get 'settings', to: 'profile#settings'
  
  resources :properties
  post 'create_property', to: 'properties#create'

end
