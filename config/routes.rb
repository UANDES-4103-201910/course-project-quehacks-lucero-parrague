Rails.application.routes.draw do
  resources :reports

  resources :sharedposts

  resources :posts do
    resources :comments
    resources :votes
  end

  resources :users



  post 'posts/:id/sharedposts/new' => 'sharedposts#new'
  post 'posts/:id/comments/new' => 'comments#new', as: :comment
  post 'posts/:id/votes/new' => 'votes#new', as: :vote
  delete 'users/:id' => 'users#destroy'
  patch 'users/:id' => 'users#update'
  delete 'posts/:id' => 'posts#destroy'
  patch 'posts/:id' => 'posts#update'
  patch 'votes/:id' => 'votes#update'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
