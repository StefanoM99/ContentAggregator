Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users

  get "/home", to: "home#index"
  root "home#index"
  

=======
>>>>>>> 17be707624ffe9dc93677fb965f5d8465549e9fc
  resources :articles

  get "/home", to: "home#index"
  get '/registration',to:"user#registration"
  
  get "/articles", to: "articles#index"
<<<<<<< HEAD

  
 
  
=======
  
  root "home#index"
    
>>>>>>> 17be707624ffe9dc93677fb965f5d8465549e9fc
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


