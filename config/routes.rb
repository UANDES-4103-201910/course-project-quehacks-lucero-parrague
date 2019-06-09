Rails.application.routes.draw do
  devise_for :users,
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' },
             path: 'auth',
             path_names: { sign_in: 'login', sign_out: 'logout',
                           password: 'secret', confirmation: 'verification',
                           unlock: 'unblock', registration: 'register',
                           sign_up: 'Join us' }


  resources :posts do
    resources :sharedposts
    resources :comments
    resources :votes
    resources :reports
  end

  resources :users
  get 'posts/dumpster' => 'posts#dumpster'
  post 'posts/:id/sharedposts/new' => 'sharedposts#new', as: :sharedpost
  post 'posts/:id/comments/new' => 'comments#new', as: :comment
  post 'posts/:id/votes/new' => 'votes#new', as: :vote
  delete 'users/:id' => 'users#destroy'
  patch 'users/:id' => 'users#update'
  delete 'posts/:id' => 'posts#destroy'
  patch 'posts/:id' => 'posts#update'
  patch 'votes/:id' => 'votes#update'



  patch 'posts/:id/trash' => "posts#trash"
  patch 'users/:id/blacklist' => "users#blacklist"


  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
