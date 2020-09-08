Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :topics, only: [:index, :show] do
    resources :themes
  end

  resources :themes do
    resources :comments, except: [:destroy]
    resources :themeupvotes, only: [:create]
    resources :bookmarks, only: [:index, :create, :destroy]
  end

  resources :comments, only: [:destroy] do 
    resources :commentupvotes, only: [:create]
  end

  resources :topics, only: [:index, :show] do
    resources :articles
  end

  resources :themeupvotes, only: [:destroy] 
  resources :commentupvotes, only: [:create, :destroy] 

  resources :users

  get "/dashboard", to: "comments#dashboard"
  
  resources :searches, only: :index

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
