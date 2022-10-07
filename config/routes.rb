Rails.application.routes.draw do

  scope '/feed' do
    resources :articles, :posts, :forecasts, :playlists
  end

   
    resources :starred_articles, :reported_articles
    resources :my_posts, :edited_posts, :starred_posts, :reported_posts, :starred_playlists, :reported_playlists
  
  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' , registrations: 'users/registrations'}
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :users do
    resources :starred_articles, :reported_articles, :articles
    resources :my_posts, :edited_posts, :starred_posts, :reported_posts
    resources :starred_playlists, :reported_playlists
  end 
  get "/home", to: "home#index"
  root "home#index"

 
  
  get "/feed", to: "feeds#index"
  
  get "/articles", to: "articles#index"
  get "/posts", to: "posts#index"
  get "/forecasts", to: "forecasts#index"
  get "/playlists", to: "playlists#index"

  get '/users/:user_id/my_posts', to: 'my_posts#index'  ,as: 'user_posts'
  get '/users/:user_id/edited_posts', to: 'edited_posts#index'  ,as: 'edited_user_posts'
  get '/users/:user_id/starred_posts', to: 'starred_posts#index'  ,as: 'starred_user_posts'
  get '/users/:user_id/reported_posts', to: 'reported_posts#index'  ,as: 'reported_user_posts'
  get '/users/:user_id/starred_articles', to: 'starred_articles#index'  ,as: 'starred_user_articles'
  get '/users/:user_id/reported_articles', to: 'reported_articles#index'  ,as: 'reported_user_articles'
  get '/users/:user_id/starred_playlists', to: 'starred_playlists#index'  ,as: 'starred_user_playlists'
  get '/users/:user_id/reported_playlists', to: 'reported_playlists#index'  ,as: 'reported_user_playlists'

  # help
  get "pages/help"
  get "pages/account"
  get "pages/profile"
  get "pages/posts"
  get "pages/users"
  get "pages/contacts"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


