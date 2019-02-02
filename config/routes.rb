Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'toppages/index'
  resources :tasks
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
