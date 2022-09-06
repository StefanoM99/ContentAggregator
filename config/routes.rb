Rails.application.routes.draw do

  resources :articles, :forecasts

  devise_for :users

  get "/home", to: "home#index"
  root "home#index"

  get '/registration',to:"user#registration"
  
  get "/articles", to: "articles#index"
  get "/forecasts", to: "forecasts#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


