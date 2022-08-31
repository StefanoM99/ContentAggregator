Rails.application.routes.draw do
<<<<<<< HEAD
  get '/registration',to:"user#registration"
  get "/home", to: "home#index"
  root "home#index"
  
=======
  resources :articles

  get "/articles", to: "articles#index"

  get "/", to: "home#index"
  root "application#home"
>>>>>>> 72b556a2173dba29e12427ba6a89381658383a4c
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


