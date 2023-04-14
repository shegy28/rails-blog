Rails.application.routes.draw do
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  
  
  devise_for :users
  root to: 'users#index'
  resources :users, only: [:index, :show]  do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do 
      resources :comments, only: [ :new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end


  namespace :api do
    post 'login', to: 'login#index'
    resources :users, only: [:index] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end
