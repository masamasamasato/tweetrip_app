Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get "entrance/entry_top" => "entrance#entry_top"
  post "login_tweetrip" => "entrance#login_tweetrip"
  post "logout_tweetrip" => "entrance#logout_tweetrip"
  
  root "home#top"
  get "home/about" => "home#about"
  
  
  get "posts/new" => "posts#new"
  get "posts/index" => "posts#index"
  get "posts/:id" => "posts#show",as: "post"
  patch 'posts/:id' => 'posts#update'
  delete "posts/:id" => "posts#destroy"
  get "posts/:id/edit" => "posts#edit", as:"edit_post"
  post "posts/create" => "posts#create"

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

# いいね関係

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :relationships, only: [:create, :destroy]

end
