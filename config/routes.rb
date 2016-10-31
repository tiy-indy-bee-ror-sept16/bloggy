Rails.application.routes.draw do
  resources :posts
  root 'users#index'
  resources :users

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # delete '/logout' => 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
