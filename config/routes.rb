Rails.application.routes.draw do
  resources :posts do
    resources :rejoiners
  end
  root 'users#index'
  resources :users

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # delete '/logout' => 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

  get '/forgot_password' => 'forgot_password#new', as: :forgot_password
  post '/forgot_password' => 'forgot_password#create'
  get '/forgot_password/:id' => 'forgot_password#show', as: :reset_password

  resources :topics, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
