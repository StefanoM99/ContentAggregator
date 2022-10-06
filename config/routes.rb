Rails.application.routes.draw do

  scope '/feed' do
    resources :articles, :posts, :forecasts, :playlists
  end


    resources :starred_articles, :reported_articles
    resources :my_posts, :edited_posts, :starred_posts, :reported_posts, :starred_playlists, :reported_playlists
  
  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end


  get "/home", to: "home#index"
  root "home#index"
 
  resources :users

  get '/registration',to:"user#registration"
  
  get "/feed", to: "feeds#index"
  
  get "/articles", to: "articles#index"
  get "/posts", to: "posts#index"
  get "/forecasts", to: "forecasts#index"
  get "/playlists", to: "playlists#index"

  get '/users/:id/my_posts', to: 'my_posts#index'  ,as: 'user_posts'
  get '/users/:id/edited_posts', to: 'edited_posts#index'  ,as: 'edited_user_posts'
  get '/users/:id/starred_posts', to: 'starred#index'  ,as: 'starred_user_posts'
  get '/users/:id/reported_posts', to: 'reported_posts#index'  ,as: 'reported_user_posts'
  get '/users/:id/starred_articles', to: 'starred_articles#index'  ,as: 'starred_user_articles'
  get '/users/:id/reported_articles', to: 'reported_articles#index'  ,as: 'reported_user_articles'
  get '/users/:id/starred_playlists', to: 'starred_playlists#index'  ,as: 'starred_user_playlists'
  get '/users/:id/reported_playlists', to: 'reported_playlists#index'  ,as: 'reported_user_playlists'
  
  get "/comments", to: "comments#index"


  # help
  get "pages/help"
  get "pages/account"
  get "pages/profile"
  get "pages/posts"
  get "pages/users"
  get "pages/contacts"
  
  




  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


