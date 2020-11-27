Rails.application.routes.draw do
  
  
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'users#index'
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:show, :create, :edit, :update] do
    member do
      get :followings
      get :followers
    end
  end
  namespace :posts do
    resources :searches, only: [:index]
  end
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create]
  end
  
  resources :relationships, only: [:create, :destroy]
  
  
end
