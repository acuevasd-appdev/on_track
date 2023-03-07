Rails.application.routes.draw do
  root "habits#index"
  
  resources :supports #, only: [:create,:destroy] 
  resources :steps #, except: [:index,:show]  REVIEW
  resources :friend_requests #, except: [:index,:show,:new,:edit]
  resources :habits #, except: [:index,:show]  REVIEW
  devise_for :users

  get ":username" => "users#show", as: :profile
  get ":username/progress" => "users#progress", as: :progress
  get ":username/feed" => "users#feed", as: :feed
  get ":username/friends" => "users#friends", as: :friends
  get ":username/pending" => "users#pending", as: :pending
end
