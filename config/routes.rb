Rails.application.routes.draw do
  devise_for :users,
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
             path: 'auth',
             path_names: { sign_in: 'login', sign_out: 'logout',
                           password: 'secret', confirmation: 'verification',
                           unlock: 'unblock', registration: 'register',
                           sign_up: 'Join us' }
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


  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
