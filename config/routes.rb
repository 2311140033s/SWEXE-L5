Rails.application.routes.draw do
  root "tweets#index"

  get  "signup" => "users#new"
  post "users/create" => "users#create"
  get  "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  resources :tweets, only: [:index, :new, :create, :destroy]
  resources :likes, only: [:create, :destroy]
end

