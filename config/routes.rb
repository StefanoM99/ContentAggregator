Rails.application.routes.draw do
  devise_for :users

  get "/home", to: "home#index"
  root "home#index"
  

  resources :articles

  get "/articles", to: "articles#index"

  
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


