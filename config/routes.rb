Rails.application.routes.draw do
  root to: 'visitors#index'
  
  #devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :profile 
    
  get 'bank', to: 'profile#bank'
  get 'dashboard', to: 'profile#dashboard'
  get 'about', to: 'profile#about'
  
  resources :properties
  post 'create_property', to: 'properties#create'

end
