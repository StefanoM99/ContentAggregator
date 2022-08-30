Rails.application.routes.draw do
  resources :articles

  get "/articles", to: "articles#index"

  get "/", to: "home#index"
  root "application#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


