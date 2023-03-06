Rails.application.routes.draw do
  root "habits#index"
  
  resources :supports
  resources :steps
  resources :friend_requests
  resources :habits
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
