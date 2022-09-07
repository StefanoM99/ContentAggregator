Rails.application.routes.draw do

  resources :articles, :posts, :forecasts

  devise_for :users

  get "/home", to: "home#index"
  root "home#index"

  get '/registration',to:"user#registration"
  
  get "/feed", to: "feeds#index"
  get "/feed/articles", to: "articles#index"
  get "/feed/posts", to: "posts#index"
  get "/feed/forecasts", to: "forecasts#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


