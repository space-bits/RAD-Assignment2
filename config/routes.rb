Rails.application.routes.draw do
  get 'sessions/new'
  root 'news#index'

  resources :users

  resources :news do
    resources :comments, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
