Rails.application.routes.draw do
  
  
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'users#index'
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:index, :show, :create, :edit, :update] do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :posts, only: [:show, :create, :edit, :update, :destroy]
  resources :relationships, only: [:create, :destroy]
end
