Rails.application.routes.draw do
  
  
  root to: 'users#index'
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:index, :show, :create, :edit, :update]
  resources :posts, only: [:show, :create, :edit, :update, :destroy]
end
