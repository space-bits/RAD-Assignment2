Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  root 'articles#index'

  get '/news', to: 'articles#index'
  get '/news/:id', to: 'articles#show'
  get '/comments', to: 'comments#index'

  get '/submit', to: 'articles#new'
  post '/submit', to: 'articles#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :articles do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
