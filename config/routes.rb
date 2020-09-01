Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :topics, only: [:index, :show] do 
    resources :themes
  end
  
  resources :themes do
    resources :comments
  end

  resources :topics, only: [:index, :show] do
    resources :articles, only [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
