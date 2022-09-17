Rails.application.routes.draw do
  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end

  get "/home", to: "home#index"
  
  

  resources :articles

  
  
  
  get "/articles", to: "articles#index"
  
  root "home#index"
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


