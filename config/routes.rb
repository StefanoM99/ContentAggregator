Rails.application.routes.draw do

  get '/registration',to:"user#registration"
  get "/home", to: "home#index"
  root "home#index"
  

  resources :articles

  get "/articles", to: "articles#index"

  get "/", to: "home#index"
  post "/registration", to:"user#create"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


