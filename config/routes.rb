Rails.application.routes.draw do
  root 'news#index'

  get '/signup' to: 'users#new'
  get '/login' to: 'sessions#new'
  get '/logout' to: 'sessions#destroy'

  resources :users
  resources :news do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
