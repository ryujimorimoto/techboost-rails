Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  resources :users
  resources :topics
  resources :comments

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  post 'favorites/delete', to: 'favorites#delete'
  delete '/favorites',  to: 'favorites#destroy'


  get 'comments/index'
  post '/comments', to: 'comments#create'



  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end

