Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  namespace :posts do
    resources :searches, only: [:index]
  end
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    member do
      get :likers
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  
  
end
