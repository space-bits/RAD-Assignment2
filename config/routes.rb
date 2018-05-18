Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users#, only: [:show, :edit, :new, :create]

  root 'articles#index'

  get '/news', to: 'articles#index'
  get '/news/:id', to: 'articles#show'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/comments', to: 'comments#index'
  get '/comments20', to: 'comments#show_top_20'

  resources :articles do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
