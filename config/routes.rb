Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  root 'news#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/comments', to: 'comments#index'

  resources :comments, only: [:show]

  resources :users
  resources :news do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
