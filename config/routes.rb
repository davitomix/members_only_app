Rails.application.routes.draw do
  get 'posts/new'
  root 'sessions#new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: %i[new create show]
  resources :posts, only: %i[index create new show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
